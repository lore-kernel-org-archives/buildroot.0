From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:36:23 +0200
Subject: [Buildroot] [PATCH 05/12] libfreefare: Bump version and change
 site
In-Reply-To: <1437943118-18060-6-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1437943118-18060-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150726233623.7b779211@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:31 +0200, Maxime Hadjinlian wrote:

> -LIBFREEFARE_VERSION = 0.3.4
> -LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
> +LIBFREEFARE_VERSION = 0.4.0
> +LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
> +# Do not use the github helper here, the generated tarball is *NOT* the same
> +# # as the one uploaded by upstream for the release.

   ^^^^

Crappy text editor again?

Fixed, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
