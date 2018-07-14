From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 23:26:10 +0200
Subject: [Buildroot] [PATCH] configs: Use uboot 2018.07 in
 asus_tinker_rk3288 config
In-Reply-To: <20180711123829.29277-1-ydamigos@iccs.gr>
References: <20180711123829.29277-1-ydamigos@iccs.gr>
Message-ID: <20180714232610.7fe1ce04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jul 2018 15:38:29 +0300, Yannis Damigos wrote:
> Using uboot version 2017.11 creates an sd card image which fails to
> boot with the following error:
> 
>   Missing DTB
>   ### ERROR ### Please RESET the board ###
> 
> Updating tinkerboard default configuration to use latest uboot
> release 2018.07 creates a sd card image which boot fine.
> 
> Signed-off-by: Yannis Damigos <ydamigos@iccs.gr>
> ---
>  configs/asus_tinker_rk3288_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
