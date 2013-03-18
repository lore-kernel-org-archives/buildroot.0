From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:53 +0100
Subject: [Buildroot] [PATCH 087/120] xlib_libXi: bump revision to X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-28-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xlib_libXi/xlib_libXi.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index b658df6..b258883 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.4.2
+XLIB_LIBXI_VERSION = 1.6.1
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_INSTALL_STAGING = YES
-- 
1.7.10.4
