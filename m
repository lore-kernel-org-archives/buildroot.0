From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:20:06 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libpjsip: security bump
 to 2.7.1
Message-ID: <20171126213911.7719881539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc45524dd6dd5e229d055ca47d3982e27ddae6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Also add hash for license file

See release notes for details:
https://trac.pjsip.org/repos/milestone/release-2.7.1

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4bdc4e492ba75d34d859ca15f0c21ec8078785fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 7 ++++---
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index b35fed3..edac3d5 100644
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
index ed7761e..2ee30f2 100644
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
