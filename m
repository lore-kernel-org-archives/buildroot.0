From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Oct 2015 23:29:35 +0300
Subject: [Buildroot] [PATCH 1/3] package/kodi-pvr-argustv: add jsoncpp
 reverse dependency
In-Reply-To: <1443730342-12383-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443730342-12383-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151001202935.GA13467@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Thu, Oct 01, 2015 at 10:12:20PM +0200, Bernd Kuhls wrote:
> diff --git a/package/kodi-pvr-argustv/Config.in 
> b/package/kodi-pvr-argustv/Config.in
> index 698ff46..ad27c38 100644
> --- a/package/kodi-pvr-argustv/Config.in
> +++ b/package/kodi-pvr-argustv/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_KODI_PVR_ARGUSTV
>  	bool "kodi-pvr-argustv"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp

Why is that needed? Same for other patches in this series.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
