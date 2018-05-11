From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:39:40 +0200
Subject: [Buildroot] [git commit branch/next] mtd: bump to version 2.0.2
Message-ID: <20180511203933.5918C8CA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea7218774624d6d3dfe76d1e2f1e6a5dab446dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add license file hash.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtd/mtd.hash | 5 +++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index c452654bfb..4bd0cda097 100644
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
index 7094aad89e..83bd6a6ae9 100644
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
