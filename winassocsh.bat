assoc .sh=bashscript
ftype bashscript=C:\cygwin64\bin\mintty.exe /bin/bash -l -c 'cd "$(dirname "$(cygpath -u "%%1")")"; exec "$(cygpath -u "%%1" %%*)"'
