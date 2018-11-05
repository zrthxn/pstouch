# PowerShell Touch
### v2.3.10

This is a small CLI for PowerShell on Windows to create empty files.<br>
Touch is available in Linux systems and is a useful tool to create lots of files quickly. It's particularly helpful to web developers and 
other similar fields where a single project contains lots of files.

## Installation
You will need to have installed Git for this to work.

1. Open a PowerShell Window anywhere on your computer.
2. Go to your Documents folder by
```
cd C:\Users\<Username>\Documents
```
3. Create a folder called **WindowsPowerShell** by
```
mkdir WindowsPowerShell
```
4. Clone this repo into that folder with 
```
git clone http://github.com/zrthxn/pstouch.git WindowsPowerShell
```
5. Open a PowerShell Window **as administrator**
6. Run the following command. This allows the script to run.
```
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine
```
7. Close all PS Windows

## Useage
The first thing you should do after installation is to set your username. To do this, open a PowerShell Window anywhere and run
```
$touch_username = "<Your Local Account Username>"
``` 