From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:23:15 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_setxkbmap: bump version
	to 1.3.1, add hash
Message-ID: <20150418162757.13BDB7F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bdc16f64f0ec04adab04eabe62c40f13f462dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash |    2 ++
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
new file mode 100644
index 0000000..bdc5f1c
--- /dev/null
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002563.html
+sha256	a9ddb3963f263ba13f0ea105d8c45a531832140530217cc559587bb94f02d3e1	setxkbmap-1.3.1.tar.bz2
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 9ecf953..b923d60 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SETXKBMAP_VERSION = 1.3.0
+XAPP_SETXKBMAP_VERSION = 1.3.1
 XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SETXKBMAP_LICENSE = MIT
