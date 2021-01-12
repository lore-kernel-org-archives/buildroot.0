From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 12 Jan 2021 22:01:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/gmp: bump version to 6.2.1
Message-ID: <20210112210104.700798-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://gmplib.org/gmp6.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gmp/gmp.hash | 6 +++---
 package/gmp/gmp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index 417b9d17bf..d55e312bbb 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912	gmp-6.1.2.tar.xz
+sha256  fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2  gmp-6.2.1.tar.xz
 
 # Locally calculated
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a79d5b7d9a..5e16ef1916 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMP_VERSION = 6.1.2
+GMP_VERSION = 6.2.1
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
-- 
2.29.2
