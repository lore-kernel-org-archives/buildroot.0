From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:35 +0200
Subject: [Buildroot] [PATCH 01/10] package/x11r7/xproto_kbproto: bump
	version to 1.0.7
Message-ID: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_kbproto/xproto_kbproto.hash |    4 ++--
 package/x11r7/xproto_kbproto/xproto_kbproto.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.hash b/package/x11r7/xproto_kbproto/xproto_kbproto.hash
index 07a9b3c..c98e595 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.hash
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.hash
@@ -1,2 +1,2 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	037cac0aeb80c4fccf44bf736d791fccb2ff7fd34c558ef8f03ac60b61085479	kbproto-1.0.6.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002595.html
+sha256	f882210b76376e3fa006b11dbd890e56ec0942bc56e65d1249ff4af86f90b857	kbproto-1.0.7.tar.bz2
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index 868e518..b6c818f 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_KBPROTO_VERSION = 1.0.6
+XPROTO_KBPROTO_VERSION = 1.0.7
 XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
 XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_KBPROTO_LICENSE = MIT
-- 
1.7.10.4
