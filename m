From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Thu, 11 Jul 2019 10:51:51 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: add rng-tools
 package
In-Reply-To: <1562775673-22148-2-git-send-email-pjtexier@koncepto.io>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
 <1562775673-22148-2-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190711085151.55s4wgfe7jpic3no@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 10, 2019 at 06:21:13PM +0200, Pierre-Jean Texier wrote:
> External E-Mail
> 
> 
> More entropy is required at boot time for the ssh
> daemon to start.
> 
> So, enable rngd which feeds the entropy to the kernel
> entropy tool.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Nice!

Ludovic
> ---
>  configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> index ed25f04..f1abf83 100644
> --- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> +++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
> @@ -41,6 +41,7 @@ BR2_PACKAGE_WILC1000_FIRMWARE=y
>  BR2_PACKAGE_DEVMEM2=y
>  BR2_PACKAGE_EVTEST=y
>  BR2_PACKAGE_I2C_TOOLS=y
> +BR2_PACKAGE_RNG_TOOLS=y
>  BR2_PACKAGE_SETSERIAL=y
>  BR2_PACKAGE_SPI_TOOLS=y
>  BR2_PACKAGE_USBUTILS=y
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
