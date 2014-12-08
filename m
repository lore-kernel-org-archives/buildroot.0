From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Dec 2014 08:53:38 +0100
Subject: [Buildroot] [git commit] gstreamer1: bump version
Message-ID: <20141208075632.CE79580152@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62f7a99c38e35eaf1daf15ced9fda0578852b208
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash |    4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index c5930e6..f0e1ddc 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
-sha256	11f155784d28b85a12b50d2fc8f91c6b75d9ca325cc76aaffba1a58d4c9549c9	gstreamer-1.4.3.tar.xz
+# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-November/050375.html
+sha256	f0e305d91a93d05bf9e332cd4256ca07d77f5186a4d73847b7ae6db218f2c237  gstreamer-1.4.4.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index be84d5b..9f16289 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.4.3
+GSTREAMER1_VERSION = 1.4.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
