From: Julien Floret <julien.floret@6wind.com>
Date: Fri,  9 Sep 2016 14:05:43 +0200
Subject: [Buildroot] [PATCH] smcroute: bump to version 2.1.1
Message-ID: <20160909120543.13458-1-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/smcroute/smcroute.hash | 6 +++---
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index b24228f6205b..e1483ec18032 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  66fd32dc66b5d32670918205a94c4f2ac8c56741486326922e4d1a92f628db48  smcroute-2.0.0.tar.xz
-# From https://github.com/troglobit/smcroute/releases/download/2.0.0/smcroute-2.0.0.tar.xz.md5
-md5     cbf478e52ab9ae411adca41b9d22f68a  smcroute-2.0.0.tar.xz
+sha256  cf344922b4298b94e53fa2db8f2b064bece60f75926966f330437dfcbd76d425  smcroute-2.1.1.tar.xz
+# From https://github.com/troglobit/smcroute/releases/download/2.1.1/smcroute-2.1.1.tar.xz.md5
+md5     cd9256577fe06beaf8da2eba1a02f953  smcroute-2.1.1.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 77e7e63195f2..a3d4bc4f1764 100755
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.0.0
+SMCROUTE_VERSION = 2.1.1
 SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPLv2+
-- 
2.9.0.244.g00fa316
