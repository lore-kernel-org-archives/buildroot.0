From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:19:55 +0100
Subject: [Buildroot] [PATCH] configs: add pylibfdt where necessary
In-Reply-To: <20180211213451.2142-1-vincent.stehle@laposte.net>
References: <20180211213451.2142-1-vincent.stehle@laposte.net>
Message-ID: <20180213231955.1e5cb1d1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Feb 2018 22:34:51 +0100, Vincent Stehle wrote:
> From: Vincent Stehl? <vincent.stehle@laposte.net>
> 
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

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
