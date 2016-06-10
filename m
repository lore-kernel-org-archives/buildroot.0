From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Jun 2016 18:33:41 +0200
Subject: [Buildroot] [PATCH 2/2 v2] kodi: enable optional dependency
	on	libamcodec
References: <20160610115151.19226-1-daggs@gmx.com>
 <20160610115151.19226-2-daggs@gmx.com>
Message-ID: <5o6r2dxrp2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 10 Jun 2016 14:51:51 +0300 schrieb Dagg Stompler:

> +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> +KODI_DEPENDENCIES += libamcodec
> +KODI_CONF_OPTS += --enable-codec=amcodec

Hi,

did you find out whether this option is necessary in the future?
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/150321

Regards, Bernd
