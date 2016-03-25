From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:05 -0300
Subject: [Buildroot] [PATCH 01/10] gstreamer1: bump to version 1.8.0
Message-ID: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 8a88de8..0830fc6 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.6.3.tar.xz.sha256sum
-sha256	22f9568d67b87cf700a111f381144bd37cb93790a77e4e331db01fe854a37f24  gstreamer-1.6.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.0.tar.xz.sha256sum
+sha256	947a314a212b5d94985d89b43440dbe66b696e12bbdf9a2f78967b98d74abedc  gstreamer-1.8.0.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index b788160..9f81674 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.6.3
+GSTREAMER1_VERSION = 1.8.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.7.3
