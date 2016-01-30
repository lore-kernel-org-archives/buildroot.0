From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:13:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/liblinear: bump version to 2.1
Message-ID: <1454166799-31564-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump also fixes the broken download of the previous version.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liblinear/liblinear.hash | 2 +-
 package/liblinear/liblinear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 1c5b184..4f03fa4 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ebc71999224f5779574b11e248f1e2ef647b5d839c0380c1c5a4ac8789aa95a9  liblinear-2.01.tar.gz
+sha256	fa5c12dedc76ffca12f1681de7073b03af68163c4e4be65194217c99e55a7d68	liblinear-2.1.tar.gz
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 80ba489..a9524e3 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.01
+LIBLINEAR_VERSION = 2.1
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3c
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
-- 
2.7.0.rc3
