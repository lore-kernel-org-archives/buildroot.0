From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:03:44 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu_riscv*_virt: use mainline
 kernel
In-Reply-To: <20190329143959.28423-1-mark.corbin@embecosm.com>
References: <20190329143959.28423-1-mark.corbin@embecosm.com>
Message-ID: <20190329170344.5628aba1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 14:39:59 +0000
Mark Corbin <mark.corbin@embecosm.com> wrote:

> Update the RISC-V QEMU virt machine defconfigs to use the
> mainline 4.20.17 kernel instead of the version from the
> riscv-linux repository.
> 
> This change has been tested with QEMU 3.1.0.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  configs/qemu_riscv32_virt_defconfig | 5 ++---
>  configs/qemu_riscv64_virt_defconfig | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
