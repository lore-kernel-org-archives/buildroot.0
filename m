From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 13 Jul 2019 08:58:24 +0200
Subject: [Buildroot] [PATCH] package/leptonica: bump to version 1.78.0
In-Reply-To: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
References: <1563001107-17687-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1563001107-17687-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 14c750c..56f8643 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 dd7990ab6b6824b0cfed70920824d37b47184240f98db4085f7dbf1250cd4899  leptonica-1.77.0.tar.gz
+sha256 e2ed2e81e7a22ddf45d2c05f0bc8b9ae7450545d995bfe28517ba408d14a5a88  leptonica-1.78.0.tar.gz
 sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 7c6fa12..309c650 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.77.0
+LEPTONICA_VERSION = 1.78.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.7.4
