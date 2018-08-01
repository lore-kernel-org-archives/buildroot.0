From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 14:28:13 +0200
Subject: [Buildroot] [PATCH] firmware-imx: fix EULA and COPYING hashes
In-Reply-To: <20180801082100.18394-1-gary.bisson@boundarydevices.com>
References: <20180801082100.18394-1-gary.bisson@boundarydevices.com>
Message-ID: <20180801142813.768e8086@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 10:21:00 +0200, Gary Bisson wrote:
> NXP updated their EULA text to 2018.
> Also add QCA text for their WiFi module firmware files.
> 
> Fixes:
> http://autobuild.buildroot.net/results/144c3ac1902be605ca221e5685b13ba22db9a70e/
> http://autobuild.buildroot.net/results/c8f787cc5309a9d216fb74b13e700e520facef64/
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
