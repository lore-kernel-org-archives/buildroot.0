From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  9 Nov 2017 16:51:47 -0500
Subject: [Buildroot] [PATCH 1/1] libpjsip: bump to 2.7.1
Message-ID: <20171109215147.7361-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libpjsip/libpjsip.hash | 7 ++++---
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index b35fed3403..edac3d578f 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,5 +1,6 @@
-# From http://www.pjsip.org/release/2.7/MD5SUM.TXT
-md5	c0d322261e526cafecc176facbb0bab7  pjproject-2.7.tar.bz2
+# From http://www.pjsip.org/release/2.7.1/MD5SUM.TXT
+md5	99a64110fa5c2debff40e0e8d4676380  pjproject-2.7.1.tar.bz2
 
 # Locally computed
-sha256	1c80621a11c39151b3c2511f06abc8ef031fc712bb2f9e9923b5301b04b28f6b	pjproject-2.7.tar.bz2
+sha256	59fabc62a02b2b80857297cfb10e2c68c473f4a0acc6e848cfefe8421f2c3126	pjproject-2.7.1.tar.bz2
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a7fbd21503..6f3f9e3f1a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.7
+LIBPJSIP_VERSION = 2.7.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
-- 
2.13.6
