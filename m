From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 08:36:46 +0100
Subject: [Buildroot] [git commit] libsocketcan: install to staging
Message-ID: <20140122073712.57D289C5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8ba83fd21e4bda9cab34777bda6eb0a312b8f3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
