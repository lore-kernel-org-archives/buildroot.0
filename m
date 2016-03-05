From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:46:59 +0100
Subject: [Buildroot] [PATCH/next 20/31]
 package/kodi-screensaver-cpblobs: new package
In-Reply-To: <1456006176-21308-21-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-21-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305154659.5010032f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:25 +0100, Bernd Kuhls wrote:

> +KODI_SCREENSAVER_CPBLOBS_VERSION = 87a3abfbe6e4fd1089548eab77a84902d0e1af60
> +KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
> +KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2+

I couldn't find anything that indicates that it's GPLv2+. So by
default, it's GPLv2 only.

I've fixed that before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
