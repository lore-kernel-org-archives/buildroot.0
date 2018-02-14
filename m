From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:47:11 +0100
Subject: [Buildroot] [PATCH v2 1/2] libdrm-armada: new package
In-Reply-To: <20180202145526.20133-2-Evgeniy.Didin@synopsys.com>
References: <20180202145526.20133-1-Evgeniy.Didin@synopsys.com>
 <20180202145526.20133-2-Evgeniy.Didin@synopsys.com>
Message-ID: <20180214224711.7223ab55@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 17:55:25 +0300, Evgeniy Didin wrote:
> From: Evgeniy Didin <didin@synopsys.com>
> 
> libdrm-armada is an Etnaviv libdrm buffer object management module.
> It is used with xf86-driver-video-armada, which is Xorg driver for Etnaviv.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com

Thanks for this contribution. On the first iteration, Fabio asked the
question of whether this package was really needed.

Do you know why this isn't in upstream libdrm ? Will these additional
features always be part of a separate libdrm-package project/package,
or is it planned to have them merged in libdrm at some point ?

Indeed, the fact that libdrm already has support for etnaviv makes the
thing a bit strange.

Could you comment on this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
