GenSec -o pe32.sec $1.efi -S EFI_SECTION_PE32 # choose built efi binary
GenSec -o name.sec -S EFI_SECTION_USER_INTERFACE -n $1 # choose name
GenSec -o ver.sec -S EFI_SECTION_VERSION -n ".0" # choose version
GenSec -o depex.sec depex.bin -S EFI_SECTION_DXE_DEPEX # make dummy DEPEX section
# put own guid and filenames
GenFfs -d 1 -g $2 -o $1.ffs -i depex.sec -i pe32.sec -i name.sec -i ver.sec -t EFI_FV_FILETYPE_DRIVER
