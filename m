From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Jun 2018 11:22:08 +0300
Subject: [Buildroot] [PATCH] libressl: security bump to version 2.7.4
Message-ID: <668fc5774503fefabe4d7886f07e9721fb455149.1529050928.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-0495: ECDSA signing side-channel attack.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 53b7e0af590a..111fe4feed53 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 917a8779c342177ff3751a2bf955d0262d1d8916a4b408930c45cef326700995  libressl-2.7.2.tar.gz
+sha256 1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6  libressl-2.7.4.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 1a1dda100028..35494c823967 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.7.2
+LIBRESSL_VERSION = 2.7.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.17.1
