From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 13:31:31 +0100
Subject: [Buildroot] [PATCH v6 1/5] board/qemu/riscv32-virt: Convert
 defconfig into a fragment
In-Reply-To: <20190320230422.13592-1-alistair.francis@wdc.com>
References: <20190320230422.13592-1-alistair.francis@wdc.com>
Message-ID: <20190326133131.55c365a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Mar 2019 23:05:21 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Convert the config to the arch defconfig plus a fragment. When this
> fragment is applied we will generate the same config as we previously
> did.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  board/qemu/riscv32-virt/linux.config          |  23 ----
>  board/qemu/riscv32-virt/linux.config.fragment | 104 ++++++++++++++++++
>  configs/qemu_riscv32_virt_defconfig           |   4 +-
>  3 files changed, 106 insertions(+), 25 deletions(-)
>  delete mode 100644 board/qemu/riscv32-virt/linux.config
>  create mode 100644 board/qemu/riscv32-virt/linux.config.fragment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
