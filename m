From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 21:58:38 +0100
Subject: [Buildroot] [git commit] package/leptonica: bump to version 1.77.0
Message-ID: <20190114210500.231328CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1307c76d47c070fbe3ba64ab68b46464cfeec939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 54fe8785dc..14c750c2c2 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 5e9a33b7ce33ab39fb03cee5a7ec353b044670176303265d7c64d51539616857  leptonica-1.76.0.tar.gz
+sha256 dd7990ab6b6824b0cfed70920824d37b47184240f98db4085f7dbf1250cd4899  leptonica-1.77.0.tar.gz
 sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 5e37f939b9..7c6fa12bbe 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.76.0
+LEPTONICA_VERSION = 1.77.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
