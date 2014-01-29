From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2014 10:06:26 +0100
Subject: [Buildroot] [git commit] libsocketcan: add license information and
	fix formatting
Message-ID: <20140129093105.B434C9C6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bc4c064d22298f540830d94aaa87ef99bd3f9a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
