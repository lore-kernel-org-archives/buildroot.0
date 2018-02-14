From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 15:37:55 +0100
Subject: [Buildroot] [PATCH RFC] 18xx-ti-utils: new package
In-Reply-To: <f92c71ab69063c62e8562b05062a70fdb91b187f.1518613483.git.baruch@tkos.co.il>
References: <f92c71ab69063c62e8562b05062a70fdb91b187f.1518613483.git.baruch@tkos.co.il>
Message-ID: <20180214153755.4c365154@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 15:04:43 +0200, Baruch Siach wrote:
> These are spacial RF calibration utilities for the TI Wilink 18xx
> modules.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> 
> I encountered strange behaviour with this package. Simple 'make' does
> not build the package even when 'BR2_18XX_TI_UTILS=y' is in my .config.

Well, because it should be BR2_PACKAGE_<something>...

> +config BR2_18XX_TI_UTILS

... here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
