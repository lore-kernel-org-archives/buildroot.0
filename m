From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:46:19 +0200
Subject: [Buildroot] [PATCH V2] configs/csky_gx6605s: bump kernel to 5.0
 and use buildroot toolchain
In-Reply-To: <1561376581-19568-1-git-send-email-guoren@kernel.org>
References: <1561376581-19568-1-git-send-email-guoren@kernel.org>
Message-ID: <20190802234619.0342bfe5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

On Mon, 24 Jun 2019 19:43:01 +0800
guoren at kernel.org wrote:

> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

I dropped this option to keep the default behavior of using devtmpfs,
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
