From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 14 Feb 2018 10:37:27 +0300
Subject: [Buildroot] [PATCH] configs: add pylibfdt where necessary
In-Reply-To: <20180211213451.2142-1-vincent.stehle@laposte.net>
References: <20180211213451.2142-1-vincent.stehle@laposte.net>
Message-ID: <20180214073727.GA4721@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Add TARGET_UBOOT_NEEDS_PYLIBFDT to all defconfigs, where u-boot needs
> Python libfdt to build.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Mike Harmony <mike.harmony@snapav.com>
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Cc: Jan Kraval <jan.kraval@gmail.com>
> ---
>  configs/bananapi_m1_defconfig        | 1 +
>  configs/bananapi_m2_plus_defconfig   | 1 +
>  configs/linksprite_pcduino_defconfig | 1 +
>  configs/orangepi_lite_defconfig      | 1 +
>  configs/orangepi_one_defconfig       | 1 +
>  configs/orangepi_pc_defconfig        | 1 +
>  configs/orangepi_pc_plus_defconfig   | 1 +
>  configs/orangepi_zero_defconfig      | 1 +
>  8 files changed, 8 insertions(+)

Thanks !

Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Actually I tested various build machine settings to check
why things used to work for me w/o this patch. It turns
out that this patch fixes build when swig is not installed
on the build machine.

Regards,
Sergey
