From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Sep 2019 07:33:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump version to
 5.51
In-Reply-To: <20190924035014.31543-1-bernd.kuhls@t-online.de>
References: <20190924035014.31543-1-bernd.kuhls@t-online.de>
Message-ID: <20190924043339.fci6jnwvq4h2xdjq@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Sep 24, 2019 at 05:50:14AM +0200, Bernd Kuhls wrote:
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 15c9b670a7..e2ce2f74dc 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils-headers

What about sync with bluez5_utils-headers?

> -BLUEZ5_UTILS_VERSION = 5.50
> +BLUEZ5_UTILS_VERSION = 5.51
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
