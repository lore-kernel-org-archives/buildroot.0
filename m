From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 15:55:54 +0200
Subject: [Buildroot] [PATCH 2/3] Move and refactor package imx-lib to
 the freescale-imx directory
In-Reply-To: <1368174613-3427-3-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368174613-3427-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368174613-3427-3-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <20130510155554.604e309e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henk Fijnvandraat,

On Fri, 10 May 2013 10:30:12 +0200, Henk Fijnvandraat wrote:
> -IMX_LIB_VERSION = 12.09.01
> -# No official download site from freescale, just this mirror
> -IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
> +FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
> +FIRMWARE_IMX_SITE    = $(IMX_MIRROR_SITE)

This is wrong, it should be IMX_LIB_VERSION and IMX_LIB_SITE.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
