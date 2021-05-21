# GPSS modeling

Language: `AGPSS`

Platform: `Windows (x86)`

Interpreter: `aGPSS 1.30-demo`

# TODO

Before starting, clean the file with the code from comments. Use the program from the bin directory.

Assembly:
```bash
gcc bin/clear_comment.c -o bin/clear_comment
```
Example of use:
```bash
./bin/clear_comment < task5/main.gpps
```

## Running from Linux
1. Install wine
2. Configure the file AGSSP:
```sh
VINE_PATH="YOUR_PATH/Program Files (x86)/aGPSS/1.30-demo/WGPSSCLI.exe"
```
Example of use:
```bash
./AGSSP.sh
```