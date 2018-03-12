From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 04:44:44 -0400
Subject: [Buildroot] [PATCH 1/1] libpjsip: security bump to 2.7.2
Message-ID: <20180312084444.31321-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes:
- Crash when receiving SDP with invalid fmtp attribute
- Crash when parsing SDP with an invalid media format description

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/libpjsip.hash | 6 +++---
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index edac3d578f..36c2ea1289 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,6 +1,6 @@
-# From http://www.pjsip.org/release/2.7.1/MD5SUM.TXT
-md5	99a64110fa5c2debff40e0e8d4676380  pjproject-2.7.1.tar.bz2
+# From http://www.pjsip.org/release/2.7.2/MD5SUM.TXT
+md5	fa3f0bc098c4bff48ddd92db1c016a7a  pjproject-2.7.2.tar.bz2
 
 # Locally computed
-sha256	59fabc62a02b2b80857297cfb10e2c68c473f4a0acc6e848cfefe8421f2c3126	pjproject-2.7.1.tar.bz2
+sha256	9c2c828abab7626edf18e04b041ef274bfaa86f99adf2c25ff56f1509e813772	pjproject-2.7.2.tar.bz2
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 53b654d072..db9e474be7 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.7.1
+LIBPJSIP_VERSION = 2.7.2
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
-- 
2.14.3
