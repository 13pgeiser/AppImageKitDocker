#!/bin/bash
set -e
docker rm -f AppImage || true
docker build -t appimage .
docker run --rm --entrypoint cat appimage /appimagetool-x86_64.AppImage > appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage


