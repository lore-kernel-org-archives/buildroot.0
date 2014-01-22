From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 22 Jan 2014 08:32:37 +0100
Subject: [Buildroot] [PATCH] libsocketcan: install to staging
Message-ID: <1390375957-21365-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsocketcan/libsocketcan.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 920a900..141e2d7 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -6,5 +6,6 @@
 LIBSOCKETCAN_VERSION = 0.0.9
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
+LIBSOCKETCAN_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.7
