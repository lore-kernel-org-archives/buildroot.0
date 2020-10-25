From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:52:31 +0100
Subject: [Buildroot] [git commit] package/scrypt: bump to version 1.3.1
Message-ID: <20201025144240.4D5558600F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de0a8943f2a7f82d8c32f1c904cdfeb48ad9b384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYRIGHT (update in year:
https://github.com/Tarsnap/scrypt/commit/8584d33ad75eb6c920df13e17a6af91c1c4576d0)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scrypt/scrypt.hash | 6 +++---
 package/scrypt/scrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/scrypt/scrypt.hash b/package/scrypt/scrypt.hash
index c73ff515bc..4004b89737 100644
--- a/package/scrypt/scrypt.hash
+++ b/package/scrypt/scrypt.hash
@@ -1,4 +1,4 @@
-# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.0.asc
-sha256  263034edd4d1e117d4051d9a9260c74dedb0efaf4491c5152b738978b3f32748  scrypt-1.3.0.tgz
+# From http://www.tarsnap.com/scrypt/scrypt-sigs-1.3.1.asc
+sha256  df2f23197c9589963267f85f9c5307ecf2b35a98b83a551bf1b1fb7a4d06d4c2  scrypt-1.3.1.tgz
 # Locally computed
-sha256  adc1942c42da6e3370223a27ff4a6835924d2b41e509f9bee58a5e6ca1bbddae  COPYRIGHT
+sha256  1fb4da0e9000287414066a238f378528d5652f89b72b4a1d6b89fdd20031b22d  COPYRIGHT
diff --git a/package/scrypt/scrypt.mk b/package/scrypt/scrypt.mk
index 820664f6c1..fb305faf41 100644
--- a/package/scrypt/scrypt.mk
+++ b/package/scrypt/scrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCRYPT_VERSION = 1.3.0
+SCRYPT_VERSION = 1.3.1
 SCRYPT_SOURCE = scrypt-$(SCRYPT_VERSION).tgz
 SCRYPT_SITE = http://www.tarsnap.com/scrypt
 SCRYPT_LICENSE = BSD-2-Clause
