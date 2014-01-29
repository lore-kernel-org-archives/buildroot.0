From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 29 Jan 2014 09:36:26 +0100
Subject: [Buildroot] [PATCH] libsocketcan: add license information and fix
	formatting
Message-ID: <1390984586-30571-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsocketcan/libsocketcan.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libsocketcan/libsocketcan.mk b/package/libsocketcan/libsocketcan.mk
index 141e2d7..bc12bdb 100644
--- a/package/libsocketcan/libsocketcan.mk
+++ b/package/libsocketcan/libsocketcan.mk
@@ -3,9 +3,11 @@
 # libsocketcan
 #
 ################################################################################
+
 LIBSOCKETCAN_VERSION = 0.0.9
 LIBSOCKETCAN_SITE = http://www.pengutronix.de/software/libsocketcan/download/
 LIBSOCKETCAN_SOURCE = libsocketcan-$(LIBSOCKETCAN_VERSION).tar.bz2
 LIBSOCKETCAN_INSTALL_STAGING = YES
+LIBSOCKETCAN_LICENSE = LGPLv2.1+
 
 $(eval $(autotools-package))
-- 
1.7.7
