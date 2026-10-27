#!/bin/sh

# Print the runtime fontconfig configuration with conf.d included file by file,
# minus the host font cache directories added by 50-flatpak.conf.
#
# Flatpak exposes the host caches read-only as /run/host/fonts-cache and
# /run/host/user-fonts-cache. Google Chrome and Brave bundle their own
# fontconfig and write *-le64.cache-12 files there in a format the runtime's
# fontconfig 2.18 misreads, which makes SkiaSharp spin forever at startup.

set -e

sed -n '1,/<include ignore_missing="yes">conf.d<\/include>/p' /etc/fonts/fonts.conf | sed '$d'

for file in /etc/fonts/conf.d/*.conf; do
    if [ "$(basename "$file")" = "50-flatpak.conf" ]; then
        grep -v -e '/run/host/fonts-cache' -e '/run/host/user-fonts-cache' "$file" |
            sed -e '/<?xml/d' -e '/<!DOCTYPE/d' -e '/<\/\{0,1\}fontconfig>/d'
    else
        echo "	<include ignore_missing=\"yes\">$file</include>"
    fi
done

sed -n '/<include ignore_missing="yes">conf.d<\/include>/,$p' /etc/fonts/fonts.conf | sed '1d'
