# tutorial from https://mjg59.dreamwidth.org/18773.html

## build

    github/hi-efi/mjg59.dreamwidth.org(master)$ make
    cc -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -I/usr/include/efi -I/usr/include/efi/x86_64 -I/usr/include/efi/protocol -DEFI_FUNCTION_WRAPPER   -c -o test.o test.c
    ld -o test.so -nostdlib -znocombreloc -T /usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -L/usr/lib -L/usr/lib /usr/lib/crt0-efi-x86_64.o -lefi -lgnuefi test.o 
    objcopy -j .text -j .sdata -j .data \
            -j .dynamic -j .dynsym  -j .rel \
            -j .rela -j .reloc -j .eh_frame \
            --target=efi-app-x86_64 test.so test.efi
