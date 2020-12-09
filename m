From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  9 Dec 2020 22:27:03 +0100
Subject: [Buildroot] [PATCH v1 01/14] package/gstreamer1: bump version to
 1.18.2
Message-ID: <20201209212716.15472-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index d970e9c646..ca255f7f6f 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.1.tar.xz.sha256sum
-sha256  79df8de21f284a105a5c1568527f8c559c583c85c0f2bd7bdb5b0372b8beecba  gstreamer-1.18.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.18.2.tar.xz.sha256sum
+sha256  66cdeb4f970c2e55932a2f427177d438fe2c55c0b6d29e80fda80263f2ae5446  gstreamer-1.18.2.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 963a7006d3..a4df1862db 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.18.1
+GSTREAMER1_VERSION = 1.18.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.29.2
