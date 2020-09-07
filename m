From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:48:14 +0200
Subject: [Buildroot] [PATCH] config/odroidc2: fix uboot version
In-Reply-To: <20200906193831.27631-1-yann.morin.1998@free.fr>
References: <20200906193831.27631-1-yann.morin.1998@free.fr>
Message-ID: <20200907224814.19f7fa67@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 21:38:31 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The custom UBoot version was not correctly specified, causing the latest
> one to be selected instead:
> 
>     /home/ymorin/dev/buildroot/buildroot/configs/odroidc2_defconfig:25:warning:
>     symbol value '"2020.07"' invalid for BR2_TARGET_UBOOT_CUSTOM_VERSION
> 
> Fixes:
>     https://gitlab.com/ymorin/buildroot/-/jobs/723411844
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Dagg Stompler <daggs@gmx.com>
> ---
>  configs/odroidc2_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
