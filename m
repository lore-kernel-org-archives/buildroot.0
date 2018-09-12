From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 17:18:01 +0200
Subject: [Buildroot] [PATCH v2 0/6] Add RISC-V 64-bit architecture
 support
In-Reply-To: <20180912102256.3164-1-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
Message-ID: <20180912171801.36045fb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:50 +0100, Mark Corbin wrote:

> Mark Corbin (6):
>   linux: add hash file
>   package/linux-headers: add support for custom headers
>   arch: allow GCC target options to be optionally overwritten
>   arch: add support for RISC-V 64-bit (riscv64) architecture
>   boot/riscv-pk: add bootloader for RISC-V architecture
>   configs/qemu: add qemu_riscv64_virt_defconfig

Thanks a lot for this new version! From a quick look it looks pretty
good! I'll comment on each patch separately.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
