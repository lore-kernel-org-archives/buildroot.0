From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:30:14 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: qstrip
 BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
In-Reply-To: <20170407100323.6871-1-michael@amarulasolutions.com>
References: <20170407100323.6871-1-michael@amarulasolutions.com>
Message-ID: <20170408153014.63ad6f59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Apr 2017 12:03:22 +0200, Michael Trimarchi wrote:

>  UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>  UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
> +UBOOT_CUSTOM_DTS_PATH=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))

Space around = signs to match our coding style. Also, I've moved this
assignment closer to where it's used.

Applied with those two issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
