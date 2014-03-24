From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Mar 2014 15:17:33 +0100
Subject: [Buildroot] [git commit] libsocketcan: bump to 0.0.10
Message-ID: <20140324142756.F2F099C32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ece1a6a2cd8ff8c37123bb6bf4af9a6e08e2edd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsocketcan/libsocketcan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
