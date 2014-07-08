From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 00:08:00 +0200
Subject: [Buildroot] [PATCH 11/13] libraw: add license information
In-Reply-To: <1404304811-27480-11-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:40:09 -0300")
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
 <1404304811-27480-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ion7v70f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/libraw/libraw.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
 > index bd52cc0..6720edc 100644
 > --- a/package/libraw/libraw.mk
 > +++ b/package/libraw/libraw.mk
 > @@ -7,10 +7,11 @@
 >  LIBRAW_VERSION = 0.13.4
 >  LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 >  LIBRAW_SITE = http://www.libraw.org/data/
 > -
 >  LIBRAW_INSTALL_STAGING = YES
 >  LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 >  			--disable-openmp --disable-demosaic-pack-gpl2 \
 >  			--disable-demosaic-pack-gpl3
 > +LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 > +LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf

README gives a nice overview, so I've added that as well and committed,
thanks.

-- 
Bye, Peter Korsgaard
