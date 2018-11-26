From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:06:55 +0100
Subject: [Buildroot] [PATCH v3 4/5] configs/aarch64_efi_defconfig: new
 defconfig
In-Reply-To: <20180926223719.12604-5-nunes.erico@gmail.com>
References: <20180926223719.12604-1-nunes.erico@gmail.com>
 <20180926223719.12604-5-nunes.erico@gmail.com>
Message-ID: <20181126220655.49e0f3af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:37:18 +0200, Erico Nunes wrote:
> New generic defconfig for aarch64, to run on aarch64 servers compliant
> with EFI firmware and ACPI.
> This can also be tested with qemu, and is useful so that we have an arm
> defconfig with grub enabled.
> Tested with qemu 2.11.2 and AAVMF, the aarch64 virtual machine UEFI
> firmware.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  board/aarch64-efi/genimage-efi.cfg | 30 +++++++++++++++++++++++++++
>  board/aarch64-efi/grub.cfg         |  6 ++++++
>  board/aarch64-efi/post-image.sh    |  5 +++++
>  board/aarch64-efi/readme.txt       | 17 +++++++++++++++
>  configs/aarch64_efi_defconfig      | 33 ++++++++++++++++++++++++++++++
>  5 files changed, 91 insertions(+)
>  create mode 100644 board/aarch64-efi/genimage-efi.cfg
>  create mode 100644 board/aarch64-efi/grub.cfg
>  create mode 100755 board/aarch64-efi/post-image.sh
>  create mode 100644 board/aarch64-efi/readme.txt
>  create mode 100644 configs/aarch64_efi_defconfig

I've extended a bit the readme.txt to explain that this defconfig is
not just for Qemu testing, but also for real HW, and applied to next.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
