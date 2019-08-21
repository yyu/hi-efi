# tutorial from https://station.eciton.net/fun-and-games-with-gnu-efi.html

* efi/Make.defaults is from https://raw.githubusercontent.com/vathpela/gnu-efi/master/Make.defaults
* efi/Make.rules is from https://raw.githubusercontent.com/vathpela/gnu-efi/master/Make.rules
* gnuefi.mk is from https://station.eciton.net/files/gnuefi.mk

## build

    github/hi-efi/station.eciton.net(master)$ make
    gcc -I/usr/include/efi -I/usr/include/efi/x86_64 -I/usr/include/protocol -Wno-error=pragmas -mno-red-zone -mno-avx -fpic  -g -O2 -Wall -Wextra -Werror -fshort-wchar -fno-strict-aliasing -ffreestanding -fno-stack-protector -fno-stack-check -fno-stack-check -fno-merge-all-constants -DCONFIG_x86_64 -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11 -c hello.c -o hello.o
    ld -nostdlib --warn-common --no-undefined --fatal-warnings --build-id=sha1 -shared -Bsymbolic /usr/lib/crt0-efi-x86_64.o -L /usr/lib64 -L /usr/lib /usr/lib/gcc/x86_64-linux-gnu/8/libgcc.a -T /usr/lib/elf_x86_64_efi.lds hello.o -o hello.so -lefi -lgnuefi
    objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .rel \
		-j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
		-j .reloc --target efi-app-x86_64       hello.so hello.efi
    rm hello.o hello.so

