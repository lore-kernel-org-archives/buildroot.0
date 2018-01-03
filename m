From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:48:57 +0100
Subject: [Buildroot] [PATCH 02/16] imx-lib: bump to version
 imx_4.9.11_1.0.0_ga
In-Reply-To: <20180103183842.10182-3-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-3-gary.bisson@boundarydevices.com>
Message-ID: <20180103214857.770c738f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:28 +0100, Gary Bisson wrote:

> -IMX_LIB_VERSION = 5.4
> -IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
> +IMX_LIB_VERSION = rel_imx_4.9.x_1.0.0_ga
> +IMX_LIB_SITE = https://source.codeaurora.org/external/imx/imx-lib

So now, some stuff will come from FREESCALE_IMX_SITE, some stuff from
https://source.codeaurora.org/external/imx/, and some stuff from
github,Freescale,kernel-module-imx-gpu-viv ?

Is it really that messy ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
