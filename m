From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Feb 2016 20:32:16 +0200
Subject: [Buildroot] [PATCH 1/1] configs/olimex_imx233_olinuxino: switch
 to u-boot
In-Reply-To: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
Message-ID: <20160221183216.GA2416@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Phil,

On Sun, Feb 21, 2016 at 06:24:39PM +0100, Phil Eichinger wrote:
> diff --git a/configs/olimex_imx233_olinuxino_defconfig 
> b/configs/olimex_imx233_olinuxino_defconfig
> index 2184ad8..c61a54c 100644
> --- a/configs/olimex_imx233_olinuxino_defconfig
> +++ b/configs/olimex_imx233_olinuxino_defconfig
> @@ -1,40 +1,16 @@
> -# Architecture
>  BR2_arm=y
> -BR2_arm926t=y
> -
> -# Patches (mxs-bootlets)
>  BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino"

With no patches left I think you can get rid of that as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
