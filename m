From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2020 11:12:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-matrixtrails:
 bump version to 2.2.3
In-Reply-To: <20200621145130.2262-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 21 Jun 2020 16:51:30 +0200")
References: <20200621145130.2262-1-bernd.kuhls@t-online.de>
Message-ID: <87a70v8nwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch which was applied upstream.
 > Updated license hash due to copyright year update:
 > https://github.com/xbmc/screensaver.matrixtrails/commit/c2fdf919cfa04de45ad213da7645ea435547266d

 > Removed "v" from _SITE due to changes to github release names.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.
 
 > -KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.1-Leia
 > -KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 > +KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.3-Leia
 > +KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 >  KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 >  KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = debian/copyright
 >  KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi

Notice: The patch didn't apply because we have kodi libsoil in
_DEPENDENCIES.

Local changes? Is libsoil no longer needed?

-- 
Bye, Peter Korsgaard
