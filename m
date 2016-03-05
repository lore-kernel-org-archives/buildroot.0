From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:45:08 +0100
Subject: [Buildroot] [PATCH/next 19/31]
 package/kodi-screensaver-asterwave: new package
In-Reply-To: <1456006176-21308-20-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-20-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305154508.5c575bdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 20 Feb 2016 23:09:24 +0100, Bernd Kuhls wrote:

> +################################################################################
> +#
> +# kodi-screensaver-asterwave
> +#
> +################################################################################
> +
> +KODI_SCREENSAVER_ASTERWAVE_VERSION = 0dc2c48dadb100954eef823e7e3a5f502ce65b1e
> +KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
> +KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libsoil

Could you report a bug upstream to ask the author to add a license
file ?

I've applied your patch in master, but I would welcome a follow-up
patch adding licensing information.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
