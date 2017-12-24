From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Dec 2017 20:41:59 +0200
Subject: [Buildroot] [PATCH] nettle: bump to version 3.4
Message-ID: <d2bf949e792e5909ca706bc5392bb694d9e40641.1514140919.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add link to upstream signature.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nettle/nettle.hash | 6 +++++-
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index cd911c0d1387..473be1c2dfc3 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e	nettle-3.3.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz.sig
+sha256	ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94	nettle-3.4.tar.gz
+# Locally calculated
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index e5012d2bf031..958281504836 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.3
+NETTLE_VERSION = 3.4
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.15.1
