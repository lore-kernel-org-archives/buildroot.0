From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 04 Jun 2016 23:12:47 +0200
Subject: [Buildroot] [PATCH 3/3] allow kodi to select libamlogic if set
References: <20160601102720.3929-1-daggs@gmx.com>
 <20160601102720.3929-3-daggs@gmx.com>
Message-ID: <frsb2dx2c5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 01 Jun 2016 13:27:20 +0300 schrieb Dagg:

> +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> +KODI_DEPENDENCIES += libamcodec
> +KODI_CONF_OPTS += --enable-codec=amcodec

Hi,

afaics Kodi 17.0-Krypton will remove support for amcodec:
https://github.com/xbmc/xbmc/pull/9688

Is your patch still useful after the version bump, in other words,
will libamcodec still be usable by Kodi on a Linux-based system?

Regards, Bernd
