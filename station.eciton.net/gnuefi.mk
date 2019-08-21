#
# gnuefi.mk - wrapper include for distribution packaged gnu-efi
#
# SPDX-License-Identifier: ISC
#
# Copyright (c) 2018 leif@eciton.net. All rights reserved.
#

include efi/Make.defaults
include efi/Make.rules

PREFIX = /usr
# Debian uses one path for linker script and objects ...
GNUEFI_LIBDIR = $(PREFIX)/lib
# ... and Fedora uses another.
#GNUEFI_LIBDIR = $(PREFIX)/lib64/gnuefi

CRTOBJS  = $(GNUEFI_LIBDIR)/crt0-efi-$(ARCH).o
LDSCRIPT = $(GNUEFI_LIBDIR)/elf_$(ARCH)_efi.lds

# Override settings by Make.defaults
INCDIR = -I$(PREFIX)/include/efi -I$(PREFIX)/include/efi/$(ARCH) \
	 -I$(PREFIX)/include/protocol

LDFLAGS += -shared -Bsymbolic $(CRTOBJS)
LDFLAGS += -L $(PREFIX)/lib64 -L $(GNUEFI_LIBDIR) $(LIBGCC) -T $(LDSCRIPT)
LOADLIBES += -lefi -lgnuefi

ifneq ($(HAVE_EFI_OBJCOPY), y)
EFI_SUBSYSTEM_APPLICATION=0xa
EFI_SUBSYSTEM_BSDRIVER=0xb
EFI_SUBSYSTEM_RTDRIVER=0xc

FORMAT := -O binary
LDFLAGS += --defsym=EFI_SUBSYSTEM=$(SUBSYSTEM)
endif
