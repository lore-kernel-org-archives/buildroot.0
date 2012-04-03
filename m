From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Apr 2012 22:53:42 +0200
Subject: [Buildroot] [PATCH 3/4] Fix libpng url
In-Reply-To: <79dd445eff0fb475cb94a6c03626db9fdb72f30f.1333443312.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Tue, 3 Apr 2012 10:55:31 +0200")
References: <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <79dd445eff0fb475cb94a6c03626db9fdb72f30f.1333443312.git.maxime.ripard@free-electrons.com>
Message-ID: <87fwckwn8p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

I believe this is obsolete now the png version is bumped.

 Maxime> ---
 Maxime>  package/libpng/libpng.mk |    2 +-
 Maxime>  1 files changed, 1 insertions(+), 1 deletions(-)

 Maxime> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
 Maxime> index 19d2a71..0d6a008 100644
 Maxime> --- a/package/libpng/libpng.mk
 Maxime> +++ b/package/libpng/libpng.mk
 Maxime> @@ -6,7 +6,7 @@
 
 Maxime>  LIBPNG_VERSION = 1.4.10
 Maxime>  LIBPNG_SERIES = 14
 Maxime> -LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 Maxime> +LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/older-releases/$(LIBPNG_VERSION)
 Maxime>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 Maxime>  LIBPNG_INSTALL_STAGING = YES
 Maxime>  LIBPNG_DEPENDENCIES = host-pkg-config zlib
 Maxime> -- 
 Maxime> 1.7.5.4

 Maxime> _______________________________________________
 Maxime> buildroot mailing list
 Maxime> buildroot at busybox.net
 Maxime> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
