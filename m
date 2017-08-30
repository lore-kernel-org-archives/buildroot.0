From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:11:02 +0200
Subject: [Buildroot] [git commit] mtd: bump to version 2.0.1
Message-ID: <20170902130620.3A9688016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61264acf8efff8931167cb56d26ef7d551c6c027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 6a234d2..c452654 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.0.tar.bz2.asc
-sha256	20a377aa86af4c102e930b0d0bb9859e3a10aeb16445f6a1273989b206a717c8	mtd-utils-2.0.0.tar.bz2
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.1.tar.bz2.asc
+sha256	312baa0446e4e728ceb413c53533e41e547d1c13ffa0752b2f879fd289fc2f63	mtd-utils-2.0.1.tar.bz2
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3bac2d5..e666bf0 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.0.0
+MTD_VERSION = 2.0.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
