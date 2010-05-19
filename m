From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 13:07:28 +0200
Subject: [Buildroot] [PATCH] Add support for Beagleboard
In-Reply-To: <1274167966-12366-1-git-send-email-mchazaux@adeneo-embedded.com>
References: <1274167966-12366-1-git-send-email-mchazaux@adeneo-embedded.com>
Message-ID: <20100519130728.586b2742@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micka?l,

On Tue, 18 May 2010 09:32:46 +0200
Micka?l Chazaux <mchazaux@adeneo-embedded.com> wrote:

>  configs/beagleboard_defconfig         |  838 +++++++++++++++++++++++++++++++++

Besides BR2_PACKAGE_BUSYBOX, some other BR2_PACKAGE_* are selected. Is
this intentional ?

> index 0000000..fe75ade
> --- /dev/null
> +++ b/target/device/Beagleboard/Makefile.in
> @@ -0,0 +1,3 @@
> +BOARD_NAME:="omap3_beagle"
> +BOARD_PATH:=$(call qtrip,$(BR2_BOARD_PATH))

Small typo here: should be qstrip instead of qtrip.

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
