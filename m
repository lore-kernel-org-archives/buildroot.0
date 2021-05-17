From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:23:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libdmx: add CPE
 variables
In-Reply-To: <20210515082943.2362156-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 May 2021 10:29:43 +0200")
References: <20210515082943.2362156-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2cdhx5v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:x:libdmx is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibdmx

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

 > ---
 >  package/x11r7/xlib_libdmx/xlib_libdmx.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
 > index c67593e9a4..429595b5d7 100644
 > --- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
 > +++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
 > @@ -9,6 +9,8 @@ XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 >  XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 >  XLIB_LIBDMX_LICENSE = MIT
 >  XLIB_LIBDMX_LICENSE_FILES = COPYING
 > +XLIB_LIBDMX_CPE_ID_VENDOR = x
 > +XLIB_LIBDMX_CPE_ID_PRODUCT = libdmx
 >  XLIB_LIBDMX_INSTALL_STAGING = YES
 >  XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto
 >  XLIB_LIBDMX_CONF_OPTS = --disable-malloc0returnsnull
 > -- 
 > 2.30.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
