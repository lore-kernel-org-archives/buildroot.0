From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 7 Oct 2009 14:52:19 +0200
Subject: [Buildroot] [git commit master] gstreamer: update to new upstream
	release 0.10.25
Message-ID: <20091007125247.81D2D77707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82cefcbbdaea9483e0a80503721bdb4d1ba604b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 53f1f75..76afa44 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -3,7 +3,7 @@
 # gstreamer
 #
 #############################################################
-GSTREAMER_VERSION = 0.10.23
+GSTREAMER_VERSION = 0.10.25
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
-- 
1.6.3.3
