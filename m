From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 23:04:27 +0200
Subject: [Buildroot] [PATCH 1/3] sunxi-mali-mainline-driver: bump version
In-Reply-To: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
References: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180906230427.3b524b53@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 10:49:01 +0200, Giulio Benetti wrote:
> For support H3 and H5 SoCs and r8p1 driver version.
> 
> git shortlog --invert-grep --grep travis --no-merges 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5..
> Maxime Ripard (6):
>       Add r8p1 release
>       sunxi: Move the reset test to a function
>       sunxi: Add H3 support
>       sunxi: Add H5 support
>       sunxi: Remove generic compatible
>       sunxi: Set clock rate in the driver
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
