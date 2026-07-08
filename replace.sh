#!/usr/bin/env bash
set -e

line="$1"
old_file_path="$2"
key="${line%% *}"

awk -v key="${key}" -v line="${line}" '
BEGIN { found=0 }
index($0, key " ") == 1 {
    print line
    found=1
    next
}
{
    print
}
END {
    if (!found)
        print line
}
' "${old_file_path}" > "${old_file_path}.tmp"
mv "${old_file_path}.tmp" "${old_file_path}"
