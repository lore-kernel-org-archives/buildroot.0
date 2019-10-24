From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 10:44:58 +0200
Subject: [Buildroot] [PATCH] configs/snps_hsdk: Switch to archs38_full
 CPU option
In-Reply-To: <20191023140437.37445-1-Evgeniy.Didin@synopsys.com>
References: <20191023140437.37445-1-Evgeniy.Didin@synopsys.com>
Message-ID: <dda3445d-57c4-728b-9e3b-7f6aa8b7b825@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2019 16:04, Evgeniy Didin wrote:
> Lets switch CPU option to archs38_full for HSDK to 
> get an increase in performance by using FPU extensions.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  configs/snps_archs38_hsdk_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
> index 0fc708eee1..646cd99d99 100644
> --- a/configs/snps_archs38_hsdk_defconfig
> +++ b/configs/snps_archs38_hsdk_defconfig
> @@ -1,6 +1,6 @@
>  # Architecture
>  BR2_arcle=y
> -BR2_archs38=y
> +BR2_archs38_full=y
>  
>  # Linux headers same as kernel, a 4.19 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> 
