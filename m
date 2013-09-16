From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 20:08:40 +0200
Subject: [Buildroot] [PATCH 3/3] enable needed modules for cubieboard2
In-Reply-To: <1379328727-2577-4-git-send-email-carlos@crqgestion.es>
References: <1379328727-2577-1-git-send-email-carlos@crqgestion.es>
 <1379328727-2577-4-git-send-email-carlos@crqgestion.es>
Message-ID: <20130916200840.2c79e6be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Quijano,

On Mon, 16 Sep 2013 12:52:07 +0200, Carlos Quijano wrote:

> diff --git a/board/cubietech/cubieboard2/cubieboard2_kernel.config b/board/cubietech/cubieboard2/cubieboard2_kernel.config
> index 081e00b..690b5a1 100644
> --- a/board/cubietech/cubieboard2/cubieboard2_kernel.config
> +++ b/board/cubietech/cubieboard2/cubieboard2_kernel.config
> @@ -2109,9 +2109,9 @@ CONFIG_FB_MODE_HELPERS=y
>  CONFIG_FB_SUNXI=y
>  CONFIG_FB_SUNXI_RESERVED_MEM=y
>  CONFIG_FB_SUNXI_UMP=y
> -# CONFIG_FB_SUNXI_LCD is not set
> +CONFIG_FB_SUNXI_LCD=y
>  CONFIG_FB_SUNXI_HDMI=y
> -# CONFIG_HDMI_CEC is not set
> +CONFIG_HDMI_CEC=y
>  # CONFIG_FB_ARMCLCD is not set
>  # CONFIG_FB_UVESA is not set
>  # CONFIG_FB_S1D13XXX is not set

This should be part of the patch adding the kernel configuration file.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
