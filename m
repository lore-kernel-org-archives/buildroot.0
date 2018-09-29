From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 29 Sep 2018 17:09:00 +0200
Subject: [Buildroot] [PATCH 2/6] leptonica: bump to version 1.76.0
In-Reply-To: <1538233744-7607-1-git-send-email-gilles.talis@gmail.com>
References: <1538233744-7607-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1538233744-7607-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license hash

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 3 ++-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index f67f2b8..54fe878 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b  leptonica-1.74.4.tar.gz
+sha256 5e9a33b7ce33ab39fb03cee5a7ec353b044670176303265d7c64d51539616857  leptonica-1.76.0.tar.gz
+sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 6a958a3..5e37f93 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.74.4
+LEPTONICA_VERSION = 1.76.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.7.4
