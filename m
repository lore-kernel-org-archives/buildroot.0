From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 14:56:50 -0400
Subject: [Buildroot] [PATCH 01/10] gstreamer1: bump to 1.12.3
Message-ID: <20171009185659.7631-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 4bb65f2151..2a1edbf88a 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.2.tar.xz.sha256sum
-sha256 9fde3f39a2ea984f9e07ce09250285ce91f6e3619d186889f75b5154ecf994ba gstreamer-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz.sha256sum
+sha256 d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e gstreamer-1.12.3.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 1b8a932046..723e59b208 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.2
+GSTREAMER1_VERSION = 1.12.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.13.6
