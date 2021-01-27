From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jan 2021 21:24:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/strongswan: bump to version 5.9.1
Message-ID: <20210127202407.3370591-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://wiki.strongswan.org/versions/79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index aa25d81f46..a19b311458 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.0.tar.bz2.md5
-md5  705628cddd5b7683ef8a688acd9514d8  strongswan-5.9.0.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.1.tar.bz2.md5
+md5  1f4db969d072e120dc12d1c116a0f658  strongswan-5.9.1.tar.bz2
 # Calculated based on the hash above
-sha256  72b47a385da5d1532b816d9fe04c50d074c29ed42ea3f0878fbd66335917bb66  strongswan-5.9.0.tar.bz2
+sha256  a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb  strongswan-5.9.1.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 03aa9e185e..322abfbd7b 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.0
+STRONGSWAN_VERSION = 5.9.1
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.29.2
