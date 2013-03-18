From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:47 +0100
Subject: [Buildroot] [PATCH 081/120] xlib_libXcursor: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-22-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 5adffb2..0b2c8ae 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.1.11
+XLIB_LIBXCURSOR_VERSION = 1.1.13
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
-- 
1.7.10.4
