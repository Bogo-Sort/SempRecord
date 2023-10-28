$dot = "."
$frontDir = "frontend/public"
$readme = "README.md"
$readmeDst = "."
$ffmpeg = "ffmpeg.exe"
$license = "LICENSE.txt"
$icon = "icon.ico"

# & ".\icon_generator.py"
# Run icon_generator.py if icon.ico does not already exist
if (!(Test-Path -Path ".\icon.ico")) {
    & ".\icon_generator.py"
}

Remove-Item -Path ".\dist" -Recurse -Force

$pyInstallerArgs = @(
    "--noconsole",
    # "--onedir",
    "--icon=icon.ico",

    # Data files
    "--add-data=$icon;$dot",
    "--add-data=$license;$dot",
    "--add-data=$frontDir;$frontDir",
    "--add-data=$readme;$dot",
    # Binaries
    "--add-binary=$ffmpeg;$dot",
    "main.py"
)

# Build the executable
pyinstaller @pyInstallerArgs

# Build the installer
& "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" "InnoSetup.iss"

# Move the installer to the dist directory and rename it, replace if necessary
Move-Item -Path ".\Output\mysetup.exe" -Destination ".\dist\SempRecordInstaller.exe" -Force

# Remove the Output folder
Remove-Item -Path ".\Output" -Recurse