from pathlib import Path
from datetime import datetime
import fnmatch
import argparse
import re


# --- Config -------------------------------------------------------------------

LANG_MAP = {
    ".js": "javascript", ".ts": "typescript", ".tsx": "typescriptreact",
    ".jsx": "javascriptreact", ".svelte": "svelte", ".vue": "vue",
    ".html": "html", ".css": "css", ".scss": "scss", ".less": "less",
    ".json": "json", ".yaml": "yaml", ".yml": "yaml", ".toml": "toml",
    ".py": "python", ".rb": "ruby", ".rs": "rust", ".go": "go",
    ".c": "c", ".cpp": "cpp", ".h": "c", ".java": "java",
    ".sh": "bash", ".bash": "bash", ".zsh": "bash",
    ".sql": "sql", ".md": "markdown", ".xml": "xml", ".tf": "hcl",
}


# --- Gitignore ----------------------------------------------------------------

def load_gitignore_patterns(root: Path) -> list[tuple[Path, str]]:
    """Load patterns from all .gitignore files found at root and its parents."""
    patterns: list[tuple[Path, str]] = []

    for directory in [root] + list(root.parents):
        gi = directory / ".gitignore"
        if gi.exists():
            try:
                for line in gi.read_text(encoding="utf-8").splitlines():
                    line = line.strip()
                    if line and not line.startswith("#"):
                        patterns.append((directory, line))
            except OSError:
                pass

    return patterns


def is_ignored(path: Path, root: Path, patterns: list[tuple[Path, str]], output_name: str) -> bool:
    """Check if a path should be excluded from the export."""
    name = path.name

    if name.startswith(".") or name == output_name:
        return True

    for base_dir, pat in patterns:
        try:
            rel = path.relative_to(base_dir)
        except ValueError:
            continue

        rel_str = rel.as_posix()
        parts = rel_str.split("/")

        is_dir_pat = pat.endswith("/")
        clean_pat = pat.rstrip("/")

        for target in [name, rel_str] + parts:
            if fnmatch.fnmatch(target, clean_pat):
                if is_dir_pat and not path.is_dir():
                    continue
                return True

    return False


# --- Tree builder -------------------------------------------------------------

def build_tree(
    root: Path,
    patterns: list[tuple[Path, str]],
    output_name: str,
) -> tuple[list[str], list[Path]]:
    """Walk the directory tree, returning the ASCII tree lines and file list."""
    lines = [f"{root.name}/"]
    files: list[Path] = []

    def _walk(p: Path, prefix: str) -> None:
        try:
            items = sorted(p.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))
        except PermissionError:
            return

        items = [x for x in items if not is_ignored(x, root, patterns, output_name)]

        for i, item in enumerate(items):
            is_last = i == len(items) - 1
            connector = "└── " if is_last else "├── "
            lines.append(f"{prefix}{connector}{item.name}{'/' if item.is_dir() else ''}")

            if item.is_dir():
                _walk(item, prefix + ("    " if is_last else "│   "))
            else:
                files.append(item)

    _walk(root, "")
    return lines, files


# --- Markdown rendering -------------------------------------------------------

def make_fence(content: str) -> str:
    """Return the shortest code fence that won't clash with content."""
    max_ticks = max(
        (len(m) for m in re.findall(r"`+", content)),
        default=2,
    )
    return "`" * max(3, max_ticks + 1)


def render_file_section(f: Path, root: Path) -> list[str]:
    """Render a single file as a markdown section."""
    rel = f.relative_to(root)
    print(f"  Reading {rel}...")
    lang = LANG_MAP.get(f.suffix.lower(), "")
    lines = [f"## `{rel}`", ""]

    try:
        raw = f.read_bytes()
        if b"\x00" in raw[:8192]:
            lines += ["> ⚠️ Skipped: binary file", ""]
            return lines
        content = raw.decode("utf-8")
    except UnicodeDecodeError:
        lines += ["> ⚠️ Skipped: non-UTF-8 encoding", ""]
        return lines
    except OSError as e:
        lines += [f"> ⚠️ Error reading file: {e}", ""]
        return lines

    fence = make_fence(content)
    lines += [f"{fence}{lang}", content.rstrip(), fence, ""]
    return lines


# --- Main export --------------------------------------------------------------

def export_tree_to_md(path: str = ".", output_name: str = "structure.md", tree_only: bool = False) -> None:
    root = Path(path).resolve()

    if not root.is_dir():
        raise NotADirectoryError(f"Not a directory: {root}")

    patterns = load_gitignore_patterns(root)
    tree_lines, files = build_tree(root, patterns, output_name)

    md: list[str] = [
        "# Project Structure",
        "",
        f"Generated: {datetime.now():%Y-%m-%d %H:%M:%S}",
        "",
        "## Directory Tree",
        "",
        "```",
        *tree_lines,
        "```",
        "",
    ]

    if not tree_only:
        md += [
            "---",
            "",
            "# File Contents",
            "",
        ]
        for f in files:
            md.extend(render_file_section(f, root))

    out = root / output_name
    out.write_text("\n".join(md), encoding="utf-8")

    print(f"✓ Exported to:  {out}")
    print(f"  Files included: {0 if tree_only else len(files)}")


# --- CLI ----------------------------------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export a project tree + file contents to Markdown.")
    subparsers = parser.add_subparsers(dest="command")

    # Full export (default)
    full_parser = subparsers.add_parser("full", help="Export tree + file contents (default)")
    full_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    full_parser.add_argument("-o", "--output", default="structure.md", help="Output filename")

    # Tree only
    tree_parser = subparsers.add_parser("tree", help="Export directory tree only")
    tree_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    tree_parser.add_argument("-o", "--output", default="structure.md", help="Output filename")

    args = parser.parse_args()

    # Default to full if no subcommand given
    if args.command == "tree":
        export_tree_to_md(args.path, args.output, tree_only=True)
    else:
        path = getattr(args, "path", ".")
        output = getattr(args, "output", "structure.md")
        export_tree_to_md(path, output)

