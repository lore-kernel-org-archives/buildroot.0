From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:48 +0100
Subject: [Buildroot] [PATCH v2 10/22] package/x11r7/xapp_xmessage: bump
 version to 1.0.5
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmessage/xapp_xmessage.hash | 9 +++++++--
 package/x11r7/xapp_xmessage/xapp_xmessage.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.hash b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
index 5e1f199bd1..b668edf6a1 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.hash
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002128.html
-sha256	bcdf4b461c439bb3ade6e1e41c47d6218b912da8e9396b7ad70856db2f95ab68	xmessage-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002868.html
+md5 e50ffae17eeb3943079620cb78f5ce0b  xmessage-1.0.5.tar.bz2
+sha1 d3eca72c7173d0d9547c676a16bcec51ca1213a2  xmessage-1.0.5.tar.bz2
+sha256 373dfb81e7a6f06d3d22485a12fcde6e255d58c6dee1bbaeb00c7d0caa9b2029  xmessage-1.0.5.tar.bz2
+sha512 a8423c3986b1576fa67800c315a605a527bb9a8f594ac269a736ae7b91eed0d4d83deb89148197dc3cd3f0e51894146958ce2979f78e97dcdb99c5326e34dabe  xmessage-1.0.5.tar.bz2
+# Locally computed
+sha256 dfd5427188bd6d6647ad1a9a0644428403c6239f6aa7f9d1a17629d8cc0a4ecd COPYING
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9c855638e1..bae5da670d 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMESSAGE_VERSION = 1.0.4
+XAPP_XMESSAGE_VERSION = 1.0.5
 XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_LICENSE = MIT
-- 
2.11.0
