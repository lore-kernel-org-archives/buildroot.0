From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:47:08 +0100
Subject: [Buildroot] [git commit] package/scrypt: bump to version 1.3.0
Message-ID: <20200309140906.206D58E780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1524c1e9202eb040f6a5332862158b20cdfe29ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new COPYRIGHT file as the license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scrypt/scrypt.hash | 6 +++---
 package/scrypt/scrypt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index 8a20d42bee..c73ff515bc 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1,4 +1,4 @@
-# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.2.0.asc
-sha256  1754bc89405277c8ac14220377a4c240ddc34b1ce70882aa92cd01bfdc8569d4  scrypt-1.2.0.tgz
+# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.0.asc
+sha256  263034edd4d1e117d4051d9a9260c74dedb0efaf4491c5152b738978b3f32748  scrypt-1.3.0.tgz
 # Locally computed
-sha256  e9d3ce691acc974c05d54bdea919fa03018fcdb5abd82eab5cdb78f07c451e0a  main.c
+sha256  adc1942c42da6e3370223a27ff4a6835924d2b41e509f9bee58a5e6ca1bbddae  COPYRIGHT
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index ae5a64e71f..820664f6c1 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SCRYPT_VERSION = 1.2.0
+SCRYPT_VERSION = 1.3.0
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
 SCRYPT_LICENSE = BSD-2-Clause
-SCRYPT_LICENSE_FILES = main.c
+SCRYPT_LICENSE_FILES = COPYRIGHT
 SCRYPT_DEPENDENCIES = openssl
 SCRYPT_INSTALL_STAGING = YES
 
