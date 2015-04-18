From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:40:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xclipboard: bump
	version to 1.1.3, add hash
Message-ID: <20150418170659.2FCAD80E0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=075e936e60a201faa2ecee72051e0c665fdbd975
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash |    2 ++
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
new file mode 100644
index 0000000..682c1f3
--- /dev/null
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-September/002299.html
+sha256	9c0e0a1f4f1d49f73c6cf3ccd27b5ca0e18afc63679f1a1ee466b1d82446ebb5	xclipboard-1.1.3.tar.bz2
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 1d45970..3620f75 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.2
+XAPP_XCLIPBOARD_VERSION = 1.1.3
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
