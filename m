From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 13:55:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump version to 3.4.3
Message-ID: <20180930115549.7104-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opencv3/opencv3.hash | 2 +-
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index e2d020db9b..34baf260d4 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 81dbd5e7e9f8a4c936b94629bf4765745942a1d634ae38ec08bc57b73b28ffc5  opencv3-3.4.2.tar.gz
+sha256 4eef85759d5450b183459ff216b4c0fa43e87a4f6aa92c8af649f89336f002ec  opencv3-3.4.3.tar.gz
 sha256 fea311907cb6271b05ff5843b238e0f2edb6f204a3432975211030d20704b321  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index ea4d22743f..978f38c143 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.2
+OPENCV3_VERSION = 3.4.3
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.19.0
