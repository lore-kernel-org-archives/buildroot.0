From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:37 +0100
Subject: [Buildroot] [PATCH 11/31] package/x11r7/xapp_xlogo: bump version to
 1.0.5
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlogo/xapp_xlogo.hash | 9 +++++++--
 package/x11r7/xapp_xlogo/xapp_xlogo.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.hash b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
index 861cd596a4..a4aada48c8 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.hash
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2012-March/001905.html
-sha256	17af6f4fb73e7310e087fbfe5d773bab2b0d6f37a894ae5ee32de4693af6ba92	xlogo-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002963.html
+md5 e9d21de1dc8c8b9f854509a26a985cd7  xlogo-1.0.5.tar.bz2
+sha1 f025a0ad30c45cbec1c2f3b1610bff94fb4e9f33  xlogo-1.0.5.tar.bz2
+sha256 633d7a3aa5df61e4e643b740e5799664741ab1a0ba40593e54fcd15dc30f378e  xlogo-1.0.5.tar.bz2
+sha512 0d78e269b0be3c5de71de7f362b896bfd9934ecd9d0361b3302399b1269e029c4a9f35418d792121a1edc34405d753f9d69c996cc3a69ac717f2b0d1f736406b  xlogo-1.0.5.tar.bz2
+# Locally computed
+sha256 972b454b6c0da17cec61225ab9dfd4afc69fd8e7e4c629497197c6f79adc6fb0  COPYING
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index 380acfc404..455469e160 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLOGO_VERSION = 1.0.4
+XAPP_XLOGO_VERSION = 1.0.5
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_LICENSE = MIT
-- 
2.20.1
