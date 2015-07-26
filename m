From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:34:48 +0200
Subject: [Buildroot] [PATCH 03/12] libass: Bump version and change site
In-Reply-To: <1437943118-18060-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1437943118-18060-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150726233448.738b1591@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:29 +0200, Maxime Hadjinlian wrote:
> Google Code is a closing forge, libass has already made the move to Github.

This line is too long. Use a real text editor that wraps properly :-)

> -LIBASS_VERSION = 0.10.2
> +LIBASS_VERSION = 0.12.3
>  LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
> -LIBASS_SITE = http://libass.googlecode.com/files
> +# Do not use the github helper here, the generated tarball is *NOT* the same
> +# # as the one uploaded by upstream for the release.

   ^^^

and doesn't mess up comments when rewrapping text :-)

Applied with those issues fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
