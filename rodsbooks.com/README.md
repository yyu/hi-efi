# tutorial from http://www.rodsbooks.com/efi-programming/hello.html

see also: https://stackoverflow.com/questions/31514866/how-to-compile-uefi-application-using-gnu-efi

## build

    github/hi-efi/rodsbooks.com(master)$ make
    cc -I/usr/include/efi -I/usr/include/efi/x86_64 -I/usr/include/efi/protocol -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -Wall  -DEFI_FUNCTION_WRAPPER   -c -o main.o main.c
    ld -nostdlib -znocombreloc -T /usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -L /usr/lib -L /usr/lib /usr/lib/crt0-efi-x86_64.o  main.o -o hello.so -lefi -lgnuefi
    objcopy -j .text -j .sdata -j .data -j .dynamic \
	    -j .dynsym  -j .rel -j .rela -j .reloc \
	    --target=efi-app-x86_64 hello.so hello.efi

