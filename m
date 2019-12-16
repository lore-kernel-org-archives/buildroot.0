From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:57:03 +0100
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx: use nodtb
 variant in uboot images for 8M
In-Reply-To: <20191202200333.418111-1-juju@cotds.org>
References: <20191202200333.418111-1-juju@cotds.org>
Message-ID: <20191216225703.7c5b06e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

+Fabio in Cc.

On Mon,  2 Dec 2019 21:03:33 +0100
Julien Olivain <juju@cotds.org> wrote:

> When using u-boot.bin, u-boot is using its builtin dtb which may not
> be suitable for all cases. For TechNexion Pico Pi i.MX8M and
> i.MX8MMini, this break the USB and UMS commands. Since those boards
> does not have SD card slots, a recovery serial download is needed at
> every update.

Could you give more details? If it doesn't use a built-in DTB, which
DTB gets used?

How does using the built-in DTB breaks USB and UMS ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
