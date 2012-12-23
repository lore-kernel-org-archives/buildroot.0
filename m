From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 15:48:33 +0200
Subject: [Buildroot] [PATCH] xlib_libpciaccess: bumped to 0.13.1
Message-ID: <1356270513-18701-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 53e0356..f2a5d24 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBPCIACCESS_VERSION = 0.12.1
+XLIB_LIBPCIACCESS_VERSION = 0.13.1
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-- 
1.7.7.6
