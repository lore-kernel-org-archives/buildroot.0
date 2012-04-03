From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Apr 2012 10:23:06 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.4.10
In-Reply-To: <20120402211515.2D2F6969C3@busybox.osuosl.org>
References: <20120402211515.2D2F6969C3@busybox.osuosl.org>
Message-ID: <20120403102306.5a46d638@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 2 Apr 2012 23:13:31 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> -LIBPNG_VERSION = 1.4.9
> +LIBPNG_VERSION = 1.4.10
>  LIBPNG_SERIES = 14
> -LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
> +LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
>  LIBPNG_INSTALL_STAGING = YES
>  LIBPNG_DEPENDENCIES = host-pkg-config zlib

This breaks the build:

http://autobuild.buildroot.org/results/8aa42940f3fb2c7af5568354c906a3f3c1d5eaab/build-end.log
http://autobuild.buildroot.org/results/470b28f443877094ac22121f9c3ff88541a82f34/build-end.log
http://autobuild.buildroot.org/results/bc174de9d816da26d151513c3eeb6630a3cdbf98/build-end.log

And many, many other occurrences.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
