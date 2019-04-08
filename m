From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:30:05 +0200
Subject: [Buildroot] [PATCH 12/13] configs: nanopi_m1_plus: Bump to the
 linux kernel 5.0
In-Reply-To: <20190408151057.14455-12-shyam.saini@amarulasolutions.com>
References: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
 <20190408151057.14455-12-shyam.saini@amarulasolutions.com>
Message-ID: <20190408223005.476089eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Apr 2019 20:40:56 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
>  BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-m1-plus/patches/"

This option is no longer needed once the patch is removed (see your PATCH 09/13).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
