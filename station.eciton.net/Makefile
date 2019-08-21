include gnuefi.mk

ifeq ($(HAVE_EFI_OBJCOPY), y)
FORMAT := --target efi-app-$(ARCH)      # Boot time application
#FORMAT := --target efi-bsdrv-$(ARCH)   # Boot services driver
#FORMAT := --target efi-rtdrv-$(ARCH)   # Runtime driver
else
SUBSYSTEM=$(EFI_SUBSYSTEM_APPLICATION)  # Boot time application
#SUBSYSTEM=$(EFI_SUBSYSTEM_BSDRIVER)    # Boot services driver
#SUBSYSTEM=$(EFI_SUBSYSTEM_RTDRIVER)    # Runtime driver
endif

all: hello.efi

clean:
	rm -f *.o *.so *.efi *~
