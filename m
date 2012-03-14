From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 20:41:33 +0100
Subject: [Buildroot] [git commit] gstreamer: bump version
Message-ID: <20120314220942.090F990D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=664260a38fe101ed84f27353bb2f465b87b3f5e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 274b87a..cc29932 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -4,7 +4,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.35
+GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
