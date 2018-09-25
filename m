From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:36:05 +0200
Subject: [Buildroot] [PATCH v2 01/14] gstreamer1: bump version to 1.14.3
Message-ID: <20180925203618.23192-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add Signed-off-by
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f69cc6a386..5c8c701e0f 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.2.tar.xz.sha256sum
-sha256 4bd6127299f3f29379046bbd58a526e6353b569e0e72f7b4df2ae70df6882e09 gstreamer-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.3.tar.xz.sha256sum
+sha256 13ae530eb1d4566c3aa0cff1bbb8e64c643065bb12e2e7c707f311ab4a390456 gstreamer-1.14.3.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 26316e73cd..a92daf7e7d 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.14.2
+GSTREAMER1_VERSION = 1.14.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.19.0
