From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:47:54 +0200
Subject: [Buildroot] [PATCH 0/5] Fix fallouts from LINUX_BUILD_CMDS
 simplification
In-Reply-To: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
References: <20190422200830.2831-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190424224754.7007060d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 22:08:24 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Thomas Petazzoni (5):
>   linux: split calling "all" and "$(LINUX_TARGET_NAME)" targets
>   configs/beaglebone: kernel build needs mkimage
>   configs/qemu_nios2_10m50: kernel build needs mkimage
>   configs/qemu_ppc_mpc8544ds: kernel build needs mkimage
>   configs/qemu_ppc_virtex_ml507: kernel build needs mkimage

I've applied the series, after adding a comment in linux.mk in PATCH
1/5, as suggested by Yann.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
