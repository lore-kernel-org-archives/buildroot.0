From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 15:01:17 +0100
Subject: [Buildroot] [PATCH v6 4/5] configs: qemu_riscv*_virt: Use
 OpenSBI by default
In-Reply-To: <20190320230422.13592-4-alistair.francis@wdc.com>
References: <20190320230422.13592-1-alistair.francis@wdc.com>
 <20190320230422.13592-4-alistair.francis@wdc.com>
Message-ID: <20190326150117.6d04b5c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Mar 2019 23:05:21 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Use OpenSBI by default instead of riscv-pk (BBL).
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  board/qemu/riscv32-virt/readme.txt  | 6 +++---
>  board/qemu/riscv64-virt/readme.txt  | 6 +++---
>  configs/qemu_riscv32_virt_defconfig | 5 ++++-
>  configs/qemu_riscv64_virt_defconfig | 5 ++++-
>  4 files changed, 14 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
