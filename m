From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:02 +0100
Subject: [Buildroot] [git commit] xlib_xtrans: bump revision to X11R7.7
Message-ID: <20130324225154.F10DE9B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a7b857d154b246e602e15a5259571b45297bab8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 8582985..1d2d68a 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.2.6
+XLIB_XTRANS_VERSION = 1.2.7
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
