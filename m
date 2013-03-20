From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:01 +0100
Subject: [Buildroot] [git commit] xlib_libXtst: bump revision to X11R7.7
Message-ID: <20130324225153.223869B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aa802b3b97c39ab12ea20c3280f7159f1fdd192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index ea12389..8ca44b7 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.0
+XLIB_LIBXTST_VERSION = 1.2.1
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_INSTALL_STAGING = YES
