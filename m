From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Jul 2014 20:29:51 +0200
Subject: [Buildroot] [PATCH 1/1] xlib_libXext: Bump version to 1.3.3
In-Reply-To: <1406312991-17655-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406312991-17655-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406312991-17655-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXext/xlib_libXext.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index ebfa4bc..0920b84 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.2
+XLIB_LIBXEXT_VERSION = 1.3.3
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
 XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
-- 
1.7.10.4
