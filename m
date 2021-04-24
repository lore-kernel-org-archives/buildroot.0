From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 18:14:10 +0200
Subject: [Buildroot] [git commit] package/mender: bump version to 2.6.0
Message-ID: <20210424154733.A0A1B85F45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b32f95290f5ab976451711c6ace2ab1c0d040e4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update the progressbarlicense hash due to a year bump

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.hash | 6 +++---
 package/mender/mender.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 52e321f7e7..c2bbbe5fc1 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  339bf97b3680315baf93143745b14b8638c5402094f94a4cc5a6ea63a2568da8  2.5.0.tar.gz
+sha256  d68839eb493175a05371eec8e6ec8691ccc22c999614b9954923a0b5ebe56840  2.6.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
@@ -9,7 +9,7 @@ sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENS
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
-sha256  f4a394d9345ba64dd2796dc552c31af99c4b686a46c0eeda6538038732f771a9  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
 #
 # BSD 2 Clause license.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -41,4 +41,4 @@ sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  76417c090c1a53d6fb1409998346e59e43f13139732a46dfc8732e0b4aebba2b  LIC_FILES_CHKSUM.sha256
+sha256  4f3541ea69b9b6e3959679576c146b42ba9a840a9dc4e593bff43e5e3a313d24  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index c2bee71d93..b4c5761151 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.5.0
+MENDER_VERSION = 2.6.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
