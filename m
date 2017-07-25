From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:52:57 +0200
Subject: [Buildroot] [git commit] gstreamer1: bump version to 1.12.2
Message-ID: <20170725145000.89EDE82150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44f5f1d6a1b87e808ecced5ad73dc7f06e484ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 992b9ec..4bb65f2 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.1.tar.xz.sha256sum
-sha256 9044b9d8b3ff44457fa9e36faa59c56684b587b34dee449bfe15ec0c32a3a6d2  gstreamer-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.2.tar.xz.sha256sum
+sha256 9fde3f39a2ea984f9e07ce09250285ce91f6e3619d186889f75b5154ecf994ba gstreamer-1.12.2.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 84b2e2a..1b8a932 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.1
+GSTREAMER1_VERSION = 1.12.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
