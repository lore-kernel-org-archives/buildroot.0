From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 23:10:30 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version
Message-ID: <20130831213337.D0FEA9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a074ba117938e17430a58ac57798c2f3ba05149
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer1/gstreamer1.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
index c9808a7..79b2b56 100644
--- a/package/multimedia/gstreamer1/gstreamer1.mk
+++ b/package/multimedia/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.0.9
+GSTREAMER1_VERSION = 1.0.10
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
