@echo off
setlocal

set CGO_ENABLED=0
set GOARCH=amd64

:: Set environment for Windows build
set GOOS=windows

:: Ensure output directory exists for Windows
if not exist bin\windows mkdir bin\windows

:: Build for Windows
garble build -trimpath -ldflags "-s -w" -buildvcs=false -o bin\windows\frps.exe .\cmd\frps
garble build -trimpath -ldflags "-s -w" -buildvcs=false -o bin\windows\frpc.exe .\cmd\frpc

:: Set environment for Linux build
set GOOS=linux

:: Ensure output directory exists for Linux
if not exist bin\linux mkdir bin\linux

:: Build for Linux
garble build -trimpath -ldflags "-s -w" -buildvcs=false -o bin/linux/frps .\cmd\frps
garble build -trimpath -ldflags "-s -w" -buildvcs=false -o bin/linux/frpc .\cmd\frpc

endlocal
pause
