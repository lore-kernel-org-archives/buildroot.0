From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 15:15:05 +0100
Subject: [Buildroot] [git commit] gstreamer1: bump version
Message-ID: <20141229150126.E5D22807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64a448e8084335fca09d8c2860dfee62a707a9dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash |    4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f0e1ddc..6ef2fff 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
-sha256	f0e305d91a93d05bf9e332cd4256ca07d77f5186a4d73847b7ae6db218f2c237  gstreamer-1.4.4.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
+sha256	40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae  gstreamer-1.4.5.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 9f16289..a8b9fda 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.4.4
+GSTREAMER1_VERSION = 1.4.5
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
