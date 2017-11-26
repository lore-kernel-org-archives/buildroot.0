From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:20:13 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] libpjsip: bump to 2.7
Message-ID: <20171126213856.3AC3C81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7c16e3e117a6bfb8804de6ff0b9441a140ea20b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0f6dacb37a4e97c7acea59ea7ccda932512e3ff9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 6 +++---
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index ec636a8..b35fed3 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,5 +1,5 @@
-# From http://www.pjsip.org/release/2.6/MD5SUM.TXT
-md5	c347a672679e7875ce572e18517884b2  pjproject-2.6.tar.bz2
+# From http://www.pjsip.org/release/2.7/MD5SUM.TXT
+md5	c0d322261e526cafecc176facbb0bab7  pjproject-2.7.tar.bz2
 
 # Locally computed
-sha256	2f5a1da1c174d845871c758bd80fbb580fca7799d3cfaa0d3c4e082b5161c7b4	pjproject-2.6.tar.bz2
+sha256	1c80621a11c39151b3c2511f06abc8ef031fc712bb2f9e9923b5301b04b28f6b	pjproject-2.7.tar.bz2
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 4e2da7d..a7fbd21 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.6
+LIBPJSIP_VERSION = 2.7
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
