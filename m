From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Mar 2018 10:48:54 -0400
Subject: [Buildroot] [PATCH 1/8] gstreamer1: bump to 1.14
In-Reply-To: <20180320144901.9032-1-aduskett@gmail.com>
References: <20180320144901.9032-1-aduskett@gmail.com>
Message-ID: <20180320144901.9032-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 5 +++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index f8af907562..05b1d9d26c 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.12.4.tar.xz.sha256sum
-sha256 5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674 gstreamer-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.0.tar.xz.sha256sum
+sha256 fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e gstreamer-1.14.0.tar.xz
+sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index ea9f29a4f3..d30f28594b 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.12.4
+GSTREAMER1_VERSION = 1.14.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.14.3
