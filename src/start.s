format ELF

section ".text" executable

extrn main

public start as "_start"
start:
    call main
    hlt