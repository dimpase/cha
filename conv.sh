#! /bin/bash
for i in {0..9}
do
  /usr/bin/pandoc  -s -r html -t gfm-raw_html-native_divs-native_spans-fenced_divs-bracketed_spans https://www.gap-system.org/Manuals/doc/changes/chap$i.html -o chap$i.md
done
