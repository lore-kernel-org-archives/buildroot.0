From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 31 Jan 2021 10:50:55 +0100
Subject: [Buildroot] [PATCH] package/leptonica: bump to version 1.80.0
In-Reply-To: <20210131095057.945946-1-gilles.talis@gmail.com>
References: <20210131095057.945946-1-gilles.talis@gmail.com>
Message-ID: <20210131095057.945946-4-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added 2 spaces indentation in hash file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 4 ++--
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 56f8643355..213716705b 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 e2ed2e81e7a22ddf45d2c05f0bc8b9ae7450545d995bfe28517ba408d14a5a88  leptonica-1.78.0.tar.gz
-sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
+sha256  ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4  leptonica-1.80.0.tar.gz
+sha256  ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 309c65052b..06eda6acca 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.78.0
+LEPTONICA_VERSION = 1.80.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.25.1
