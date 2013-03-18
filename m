From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:54 +0100
Subject: [Buildroot] [PATCH 088/120] xlib_libXinerama: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-29-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index a716e95..ae3d41a 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXINERAMA_VERSION = 1.1.1
+XLIB_LIBXINERAMA_VERSION = 1.1.2
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
-- 
1.7.10.4
