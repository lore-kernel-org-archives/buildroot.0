From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:30:01 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: update Arm ARM
 toolchain 9.2-2019.12
In-Reply-To: <20200104114331.336812-1-romain.naour@gmail.com>
References: <20200104114331.336812-1-romain.naour@gmail.com>
Message-ID: <20200104163001.5c4debcc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 12:43:29 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Update to gcc 9.2.1, gdb 8.3.0, binutils 2.33.1.
> 
> See "Release Note":
> https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#
> 
> Tested with qemu_arm_vexpress_defconfig.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-arm-arm/Config.in               | 10 +++++-----
>  .../toolchain-external-arm-arm/Config.in.options       |  2 +-
>  .../toolchain-external-arm-arm.hash                    |  6 +++---
>  .../toolchain-external-arm-arm.mk                      |  6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
