From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:32:12 +0100
Subject: [Buildroot] [PATCH v4 2/3] configs/qemu: add
 qemu_riscv32_virt_defconfig
In-Reply-To: <20181021191203.2148-2-mark.corbin@embecosm.com>
References: <20181021191203.2148-1-mark.corbin@embecosm.com>
 <20181021191203.2148-2-mark.corbin@embecosm.com>
Message-ID: <20190110213212.556b9747@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 20:12:02 +0100, Mark Corbin wrote:
> Add RISC-V 32-bit defconfig for QEMU virt machine.
> 
> Tested with QEMU 2.12.1
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> 
> ---
> Changes v3 -> v4:
>   - set new variable BR2_RISCV_32 in qemu_riscv32_virt_defconfig
> ---
>  board/qemu/riscv32-virt/linux.config | 23 +++++++++++++++++++++++
>  board/qemu/riscv32-virt/readme.txt   |  7 +++++++
>  configs/qemu_riscv32_virt_defconfig  | 25 +++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 board/qemu/riscv32-virt/linux.config
>  create mode 100644 board/qemu/riscv32-virt/readme.txt
>  create mode 100644 configs/qemu_riscv32_virt_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
