From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Mar 2017 16:31:46 +0100
Subject: [Buildroot] [PATCH] xlib_libXv: correct license type
Message-ID: <20170316153146.21715-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license is actually closer to ICS than MIT, E.G.:

https://opensource.org/licenses/ISC
vs
https://opensource.org/licenses/MIT

From COPYING:
Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or MIT not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

E.G.  this is the normal ICS text which has been extended with a BSD-3c
style advertisinc clause.  Both are permissive licenses, but it is more
correct to call it ICS-like.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 26f8badc5..d113741e0 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -7,7 +7,7 @@
 XLIB_LIBXV_VERSION = 1.0.11
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXV_LICENSE = MIT
+XLIB_LIBXV_LICENSE = ICS-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
-- 
2.11.0
