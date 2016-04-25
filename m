From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 21:28:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjpeg: bump to version 2.1
In-Reply-To: <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160425212827.07703ac2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 17:20:22 +0200, Angelo Compagnucci wrote:

> -ifeq ($(BR2_PACKAGE_LIBPNG),y)
> -OPENJPEG_DEPENDENCIES += libpng
> -OPENJPEG_CONF_OPTS += --enable-png
> -else
> -OPENJPEG_CONF_OPTS += --disable-png
> -endif
> -
> -ifeq ($(BR2_PACKAGE_TIFF),y)
> -OPENJPEG_DEPENDENCIES += tiff
> -OPENJPEG_CONF_OPTS += --enable-tiff
> -else
> -OPENJPEG_CONF_OPTS += --disable-tiff
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LCMS2),y)
> -OPENJPEG_DEPENDENCIES += lcms2
> -OPENJPEG_CONF_OPTS += --enable-lcms2
> -else
> -OPENJPEG_CONF_OPTS += --disable-lcms2
> -endif

What about those optional dependencies? They are no longer used?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
