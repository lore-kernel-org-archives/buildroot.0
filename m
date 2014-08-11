From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Aug 2014 19:01:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/espeak: Depends on MMU
References: <1407675088-29617-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA386C193FF711berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1407675088-29617-1-git-send-email-bernd.kuhls at t-online.de:

> --- a/package/espeak/Config.in
> +++ b/package/espeak/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_ESPEAK
>       depends on BR2_INSTALL_LIBSTDCPP
>       depends on BR2_USE_WCHAR
>       depends on BR2_TOOLCHAIN_HAS_THREADS
> +     depends on BR2_USE_MMU # fork()

Hi,

I marked this patch as superseded by the more complete version of Arnaud:
http://patchwork.ozlabs.org/patch/379085/

Regards, Bernd
