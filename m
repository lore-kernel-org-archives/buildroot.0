From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:00 +0100
Subject: [Buildroot] [git commit] xlib_libICE: bump revision to X11R7.7
Message-ID: <20130324225147.313A29B1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fc86a48afca20062fd1161065f6ea7df158b098
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libICE/xlib_libICE.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index c9eda7e..77fc310 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.0.7
+XLIB_LIBICE_VERSION = 1.0.8
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_INSTALL_STAGING = YES
