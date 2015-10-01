From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Oct 2015 22:42:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-stalker: Needs jsoncpp
In-Reply-To: <1443727112-15603-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443727112-15603-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151001194242.GD3337@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Thu, Oct 01, 2015 at 09:18:32PM +0200, Bernd Kuhls wrote:
> diff --git a/package/kodi-pvr-stalker/Config.in 
> b/package/kodi-pvr-stalker/Config.in
> index b327fd8..3ec530c 100644
> --- a/package/kodi-pvr-stalker/Config.in
> +++ b/package/kodi-pvr-stalker/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_KODI_PVR_STALKER
>  	bool "kodi-pvr-stalker"
> +	select BR2_PACKAGE_JSONCPP

What about jsoncpp dependencies (C++, gcc 4.7)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
