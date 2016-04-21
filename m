From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:02:46 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump to version 1.8.1
Message-ID: <20160421200305.ED37A81E87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c85a073f29f3d50a2b462f0b47b8ceb68fbf5881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 0830fc6..49a609d 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.0.tar.xz.sha256sum
-sha256	947a314a212b5d94985d89b43440dbe66b696e12bbdf9a2f78967b98d74abedc  gstreamer-1.8.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.1.tar.xz.sha256sum
+sha256	5a3722fb9302dd977c17ced4240293dc777cb716dc98c8cca63d75c27e5e3107  gstreamer-1.8.1.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 9f81674..3a6dd0b 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.8.0
+GSTREAMER1_VERSION = 1.8.1
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
