From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:48:39 +0100
Subject: [Buildroot] [PATCH/next 22/31]
 package/kodi-screensaver-planestate: new package
In-Reply-To: <1456006176-21308-23-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-23-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305154839.47cb0263@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:27 +0100, Bernd Kuhls wrote:

> +################################################################################
> +#
> +# kodi-screensaver-planestate
> +#
> +################################################################################
> +
> +KODI_SCREENSAVER_PLANESTATE_VERSION = 95b6d1ec72f37bcd16cf8e5d49806193dba883f0
> +KODI_SCREENSAVER_PLANESTATE_SITE = $(call github,notspiff,screensaver.planestate,$(KODI_SCREENSAVER_PLANESTATE_VERSION))

Could you report a bug upstream to ask the author to add a license file
to his package, and submit submit a follow-up patch to use this
information?

In the mean time, I've applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
