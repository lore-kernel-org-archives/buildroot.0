From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:55 +0100
Subject: [Buildroot] [PATCH v2 17/22] package/x11r7/xapp_xsm: bump version
 to 1.0.4
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xsm/xapp_xsm.hash | 9 +++++++--
 package/x11r7/xapp_xsm/xapp_xsm.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xsm/xapp_xsm.hash b/package/x11r7/xapp_xsm/xapp_xsm.hash
index aef9e558ba..eda231fe93 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.hash
+++ b/package/x11r7/xapp_xsm/xapp_xsm.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-February/002163.html
-sha256	ad9dee2847a683841f73518a83014b0accae60e9eff7e96752a0dbc412867b4a	xsm-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002875.html
+md5 bd32c14f09d58f46084b6a8f20e6e8f1  xsm-1.0.4.tar.bz2
+sha1 dd41234e276fe8b2d0a853879568f73b6d98812a  xsm-1.0.4.tar.bz2
+sha256 9934b6893a4e52cf7435368fc8d425c371b5e32d96e420ead30166eb82d64425  xsm-1.0.4.tar.bz2
+sha512 d4e4da7c309a4eae126d2b58a13684f4dbc06b09f76dde9c89c707375df2843614f3d83bc44f9cd02f239200db3397abd86796dca0dbafc69f60482b0af5a176  xsm-1.0.4.tar.bz2
+# Locally computed
+sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff COPYING
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index d4d240774e..6d752b4d15 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSM_VERSION = 1.0.3
+XAPP_XSM_VERSION = 1.0.4
 XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_LICENSE = MIT
-- 
2.11.0
