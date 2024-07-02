import subprocess

folder_and_files = ["sample"]

for f in folder_and_files:
    command = ["build/bin/klee", 
               "examples/" + f + "/" + f + ".bc"]
    
    #result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, capture_output=True)
    result = subprocess.run(command, capture_output=True)
    if result.returncode == 0:
        print("Command output:\n", result.stdout)
    else:
        print("Error executing command:\n", result.stderr)
#clang -I klee/include -emit-llvm -c -g -O0 -fno-discard-value-names  -Xclang -disable-O0-optnone get_sign.c
