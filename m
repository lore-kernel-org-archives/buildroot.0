From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:58:42 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump to version 1.8.2
Message-ID: <20160609215904.0CE7B8027D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e69e7d9486b9c8051c456930a900f2749aee735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 49a609d..b32fcfe 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.1.tar.xz.sha256sum
-sha256	5a3722fb9302dd977c17ced4240293dc777cb716dc98c8cca63d75c27e5e3107  gstreamer-1.8.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
+sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 3a6dd0b..beea3b7 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.8.1
+GSTREAMER1_VERSION = 1.8.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
