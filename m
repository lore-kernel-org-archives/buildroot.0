From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:10:07 +0200
Subject: [Buildroot] [PATCH v2 6/6] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <20180912102256.3164-7-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-7-mark.corbin@embecosm.com>
Message-ID: <20180925221007.096fb183@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:56 +0100, Mark Corbin wrote:
> Add RISC-V 64-bit defconfig for QEMU virt machine.
> 
> Tested with QEMU 2.12.1
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
> Changes v1 -> v2:
>   - updated DEVELOPERS file (Thomas P)
>   - removed typo from readme.txt and updated text to remove BBL
>     instructions now that it has been integrated as a package
>     (Thomas P)
>   - selected a specific kernel commit rather than a branch
>     (Thomas P)
>   - removed explicit selection of BR2_BINUTILS_VERSION_2_30_X
>     (Thomas P)
>   - added selection of riscv-pk package
> ---
>  DEVELOPERS                           |  2 ++
>  board/qemu/riscv64-virt/linux.config | 23 +++++++++++++++++++++++
>  board/qemu/riscv64-virt/readme.txt   |  7 +++++++
>  configs/qemu_riscv64_virt_defconfig  | 24 ++++++++++++++++++++++++
>  4 files changed, 56 insertions(+)
>  create mode 100644 board/qemu/riscv64-virt/linux.config
>  create mode 100644 board/qemu/riscv64-virt/readme.txt
>  create mode 100644 configs/qemu_riscv64_virt_defconfig

I've applied to master, thanks! The only thing I did is
regenerate .gitlab-ci.yml to include this new defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
