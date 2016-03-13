From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Mar 2016 19:16:18 +0100
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xapp_xrandr: bump version to
	1.5.0
In-Reply-To: <1457892978-10165-1-git-send-email-bernd.kuhls@t-online.de>
References: <1457892978-10165-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1457892978-10165-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash | 4 ++--
 package/x11r7/xapp_xrandr/xapp_xrandr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
index 009ba5d..b1db30d 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.hash
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-August/002467.html
-sha256	7154ac3486b86923692f2d6cdb2991a2ee72bc32af2c4379a6f1c068f204be1b	xrandr-1.4.3.tar.bz2
+# From https://lists.freedesktop.org/archives/xorg-announce/2016-February/002677.html
+sha256	c1cfd4e1d4d708c031d60801e527abc9b6d34b85f2ffa2cadd21f75ff38151cd	xrandr-1.5.0.tar.bz2
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index d2e4cf3..583a501 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.4.3
+XAPP_XRANDR_VERSION = 1.5.0
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_LICENSE = MIT
-- 
2.7.0
