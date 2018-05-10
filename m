From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 May 2018 21:51:06 +0300
Subject: [Buildroot] [PATCH] mtd: bump to version 2.0.2
Message-ID: <98e041e9fca43ea6994cfe577e2a98202717c63c.1525978266.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mtd/mtd.hash | 5 +++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index c452654bfbe5..4bd0cda097cc 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.1.tar.bz2.asc
-sha256	312baa0446e4e728ceb413c53533e41e547d1c13ffa0752b2f879fd289fc2f63	mtd-utils-2.0.1.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.2.tar.bz2.asc
+sha256	fb3de61be8e932abb424e8ea3c30298f553d5f970ad158a737bb303bbf9660b8	mtd-utils-2.0.2.tar.bz2
+sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 7094aad89e00..83bd6a6ae988 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.0.1
+MTD_VERSION = 2.0.2
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.17.0
