From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 May 2011 09:59:16 +0200
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <4DB8134E.1030503@visionsystems.de> (Yegor Yefremov's message of
	"Wed, 27 Apr 2011 14:59:58 +0200")
References: <4DB8134E.1030503@visionsystems.de>
Message-ID: <87zkmoiecr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> Index: b/package/libnl/libnl.mk
 Yegor> ===================================================================
 Yegor> --- a/package/libnl/libnl.mk	2011-04-26 02:04:14.206276675 -0700
 Yegor> +++ b/package/libnl/libnl.mk	2011-04-27 05:43:47.382292483 -0700
 Yegor> @@ -4,9 +4,9 @@
 Yegor>  #
 Yegor>  #############################################################
 
 Yegor> -LIBNL_VERSION = 1.1
 Yegor> +LIBNL_VERSION = 3.0
 Yegor>  LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 Yegor> -LIBNL_SITE = http://distfiles.gentoo.org/distfiles
 Yegor> +LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 Yegor>  LIBNL_INSTALL_STAGING = YES

Committed, thanks.

-- 
Bye, Peter Korsgaard
