From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 16:40:50 +0200
Subject: [Buildroot] [git commit] gstreamer: bump version
Message-ID: <20110929190333.4A7DD8DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd142e80ab09ddd517f5cec6f50cd87174577e42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index ffc8745..b1456e2 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -4,7 +4,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.32
+GSTREAMER_VERSION = 0.10.35
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
