From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:10:58 +0100
Subject: [Buildroot] [git commit] xapp_xkbevd: bump revision to X11R7.7
Message-ID: <20130324225137.6ABF19B2B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbe77edf0b75effd5392b36ad3938fe47ba6d2f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 0e93b48..6327b20 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.2
+XAPP_XKBEVD_VERSION = 1.1.3
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
