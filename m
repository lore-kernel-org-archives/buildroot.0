From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:35 +0100
Subject: [Buildroot] [PATCH 09/31] package/x11r7/xapp_xhost: bump version to
 1.0.8
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xhost/xapp_xhost.hash | 9 +++++++--
 package/x11r7/xapp_xhost/xapp_xhost.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.hash b/package/x11r7/xapp_xhost/xapp_xhost.hash
index b714eb65c3..0c3879441b 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.hash
+++ b/package/x11r7/xapp_xhost/xapp_xhost.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002576.html
-sha256	93e619ee15471f576cfb30c663e18f5bc70aca577a63d2c2c03f006a7837c29a	xhost-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002950.html
+md5 a48c72954ae6665e0616f6653636da8c  xhost-1.0.8.tar.bz2
+sha1 971670858a464d4f8eeb6f4e182f9fcd94149790  xhost-1.0.8.tar.bz2
+sha256 a2dc3c579e13674947395ef8ccc1b3763f89012a216c2cc6277096489aadc396  xhost-1.0.8.tar.bz2
+sha512 55581f9bc45a70a73b13fe718ca83c4cb0a6116d26addc0f07659ebeb5bf7d2379e84cab5a1702ae77a298a66f42ae03f41ddc7d5acd61c6f18448e58ad7cb6b  xhost-1.0.8.tar.bz2
+# Locally computed
+sha256 7e69bed6fcfff05ecf454d7e4b29cd265172385833f1978f04b638f92f2cfecf  COPYING
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index a4bb16bae3..e9fb155216 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.7
+XAPP_XHOST_VERSION = 1.0.8
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_LICENSE = MIT
-- 
2.20.1
