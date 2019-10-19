From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:25:59 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabresd_qt5: Remove the swrast
 option
In-Reply-To: <20191019210525.1142-1-festevam@gmail.com>
References: <20191019210525.1142-1-festevam@gmail.com>
Message-ID: <95c6128f-2978-3b6f-cb85-e8fd1b0ca6e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 23:05, Fabio Estevam wrote:
> i.MX6 has GPU in hardware, so we really don't need to
> fallback to software rendering.
> 
> Remove the unneeded BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
> option.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout


> ---
>  configs/imx6-sabresd_qt5_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> ck
> diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
> index 7a541951ae..8fbc2beb5b 100644
> --- a/configs/imx6-sabresd_qt5_defconfig
> +++ b/configs/imx6-sabresd_qt5_defconfig
> @@ -49,7 +49,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  BR2_PACKAGE_MESA3D=y
>  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
>  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
> -BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>  BR2_PACKAGE_MESA3D_OPENGL_ES=y
>  
>  # Fonts
> 
