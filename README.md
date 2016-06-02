# Rubify

This project is a script that edits files in a Ruby project to conform to Ruby conventions. Particularly, the Ruby convention of using 2 spaces instead of a tab. When creating large Ruby files with many levels of indentation, using spaces instead of tabs can be rather tedious. However, when viewing files with different tab values, inconsistencies make the file harder to read. With this script, a developer can use tabs freely when creating a file, and then run this script to change it to spaces.

## Usage

Simply execute the file, passing in files and directories as command line arguments. No arguments causes the script to run on all files in the current directory, as well as all subdirectories. Names of files must be entered relative to the current path. Directory names can either be relative to the current path, or relative to the user's home directory.

Examples: ruby rubify.rb test.rb, ruby rubify.rb workspace/rubify
