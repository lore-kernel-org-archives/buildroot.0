From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Jan 2018 14:20:24 +0100
Subject: [Buildroot] [git commit] gstreamer1: bump to version 1.12.4
Message-ID: <20180105132127.2233F83A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea86ea99a638a52e50547bfbb2f397e1bce19447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #10631

The gstreamer plugins were recently bumped to 1.12.4, but the main
gstreamer1 package not.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index abcb62e..f8af907 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.3.tar.xz.sha256sum
-sha256 d388f492440897f02b01eebb033ca2d41078a3d85c0eddc030cdea5a337a216e gstreamer-1.12.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.4.tar.xz.sha256sum
+sha256 5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674 gstreamer-1.12.4.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index c2da601..ea9f29a 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.3
+GSTREAMER1_VERSION = 1.12.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
