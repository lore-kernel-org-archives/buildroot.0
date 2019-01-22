From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Jan 2019 21:12:20 +0200
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.91
Message-ID: <7d971394fa5f61b75c685071ad67d72e72840689.1548184340.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream provided md5 hash.

Add license fine hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lsof/lsof.hash | 7 ++++++-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 4a1249f1af04..ccb737153d94 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,2 +1,7 @@
+# From http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/CHECKSUMS_4.91
+md5 148ed410cb52e08c2adc0c60f480f11f  lsof_4.91.tar.bz2
 # Locally calculated after checking pgp signature
-sha256	81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718	lsof_4.89.tar.bz2
+# http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.91.tar.bz2.sig
+# with (old, weak) key 40BD3D55
+sha256	c9da946a525fbf82ff80090b6d1879c38df090556f3fe0e6d782cb44172450a3	lsof_4.91.tar.bz2
+sha256	32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1	dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 83a9b6c3885b..58a2d8ef1bcf 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.89
+LSOF_VERSION = 4.91
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 # Use http mirror since master ftp site access is very draconian
 LSOF_SITE = http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof
-- 
2.20.1
