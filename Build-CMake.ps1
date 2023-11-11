<#
.SYNOPSIS
    Build the project with CMake.
.DESCRIPTION
    This script will run the following commands:
    ```
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
    ```
#>
[CmdletBinding()]
param()

New-Item -Name 'build' -ItemType 'Directory' -Force
Set-Location -Path 'build'

Start-Process -FilePath 'cmake' -ArgumentList '..' -NoNewWindow -Wait
Start-Process -FilePath 'cmake' -ArgumentList '--build', '.' -NoNewWindow -Wait