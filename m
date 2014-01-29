From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 09:17:29 +0100
Subject: [Buildroot] [PATCH] libsocketcan: new package
In-Reply-To: <1389862821-16980-2-git-send-email-yegorslists@googlemail.com>
References: <1389862821-16980-1-git-send-email-yegorslists@googlemail.com>
 <1389862821-16980-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140129091729.31b6ed77@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

On Thu, 16 Jan 2014 10:00:21 +0100, yegorslists at googlemail.com wrote:
> diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
> new file mode 100644
> index 0000000..920a900
> --- /dev/null
> +++ b/package/libsocketcan/libsocketcan.mk
> @@ -0,0 +1,10 @@
> +################################################################################
> +#
> +# libsocketcan
> +#
> +################################################################################
> +LIBSOCKETCAN_VERSION = 0.0.9

Missing empty newline between comment header and the first variable.

> +LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
> +LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
> +
> +$(eval $(autotools-package))

Even if the license text is not available, it would have been good to
add LIBSOCKETCAN_LICENSE anyway.

Since Peter has already committed your patch, can you send a followup
patch to fix those two issues, against the latest master branch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
