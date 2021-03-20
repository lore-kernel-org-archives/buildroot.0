From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 23:03:58 +0100
Subject: [Buildroot] [PATCH v2 next] configs/qemu_arm_vexpress_tz: bump
 versions and update
In-Reply-To: <20210307094317.9171-1-vincent.stehle@laposte.net>
References: <YESc/7MpZkLtU1n2@romuald.bergerie>
 <20210307094317.9171-1-vincent.stehle@laposte.net>
Message-ID: <20210320230358.5a8bfc83@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Mar 2021 10:43:17 +0100
Vincent Stehl? via buildroot <buildroot@busybox.net> wrote:

> - Bump TF-A to version 2.4.
> - Bump u-boot to version 2021.01.
> - Bump kernel to version 5.11.3.
> 
> We switch TF-A to a single FIP image. Thanks to this, TF-A does not need to
> use semihosting to load the various BL* anymore (but U-Boot still does).
> Update the readme.txt accordingly.
> 
> We switch to a u-boot image for the ramdisk. This removes the need to
> update the fdt chosen node manually in the bootcmd.
> 
> While at it, we drop the generation of the kernel dtb, which we do not use.
> In this config, we are indeed using the dtb generated on-the-fly by qemu
> and amended by TF-A.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Gerome Burlats <gerome.burlats@smile.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Etienne Carriere <etienne.carriere@linaro.org>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
