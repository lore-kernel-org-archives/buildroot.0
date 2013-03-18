From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:44 +0100
Subject: [Buildroot] [PATCH 078/120] xlib_libXScrnSaver: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-19-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 11cfa99..3885aa1 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.1
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.2
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
-- 
1.7.10.4
