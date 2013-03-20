From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:10:59 +0100
Subject: [Buildroot] [git commit] xapp_xwud: bump revision to X11R7.7
Message-ID: <20130324225140.0C2459B2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17b83d0671b7d03d62937cb60d8653d315ace286
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xapp_xwud/xapp_xwud.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index cbe229f..acf5cca 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.3
+XAPP_XWUD_VERSION = 1.0.4
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
