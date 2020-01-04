From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:30:06 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-external: update Arm AArch64
 toolchain 9.2-2019.12
In-Reply-To: <20200104114331.336812-2-romain.naour@gmail.com>
References: <20200104114331.336812-1-romain.naour@gmail.com>
 <20200104114331.336812-2-romain.naour@gmail.com>
Message-ID: <20200104163006.1799918e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 12:43:30 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.
> 
> See "Release Note":
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#
> 
> Tested with qemu_aarch64_virt_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-arm-aarch64/Config.in                | 6 +++---
>  .../toolchain-external-arm-aarch64/Config.in.options        | 2 +-
>  .../toolchain-external-arm-aarch64.hash                     | 6 +++---
>  .../toolchain-external-arm-aarch64.mk                       | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
