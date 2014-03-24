From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 24 Mar 2014 11:32:34 +0100
Subject: [Buildroot] [PATCH] libsocketcan: bump to 0.0.10
Message-ID: <1395657154-6492-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsocketcan/libsocketcan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index bc12bdb..bde8d31 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOCKETCAN_VERSION = 0.0.9
+LIBSOCKETCAN_VERSION = 0.0.10
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
-- 
1.8.1.2
