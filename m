From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Sep 2017 14:02:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx: add support for
 i.MX6UL
In-Reply-To: <1504781111-21406-1-git-send-email-julien.boibessot@free.fr>
References: <1504781111-21406-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20170907110225.e2irdmlt2ojvtl26@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Sep 07, 2017 at 12:45:11PM +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/freescale-imx/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 656b44b..fa3f9a0 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -31,6 +31,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  	bool "imx6q"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
> +	bool "imx6ul"
> +
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -42,6 +45,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
>  	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> +	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL

What package do you need this for? Please elaborate on that in the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
