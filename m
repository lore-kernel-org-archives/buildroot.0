From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Feb 2017 21:40:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xkeyboard-config: bump
	version to 2.20
Message-ID: <20170201204007.8071-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 1869491e7..104a5aba1 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-September/002715.html
-sha256 83dfd186b9eb9ced69e01d8d8e2f15b6a79b2e30124874ef086f2d3048f45827  xkeyboard-config-2.19.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-February/002775.html
+sha256 d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134  xkeyboard-config-2.20.tar.bz2
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index c3d1d8977..bdaf0268d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.19
+XKEYBOARD_CONFIG_VERSION = 2.20
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.11.0
