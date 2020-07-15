From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:41:43 +0200
Subject: [Buildroot] [git commit] package/mender: bump version to 2.3.0
Message-ID: <20200715214305.A13328189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d535581c00163f99f8fa323981cc00fad5ee0334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the following license file hashes due to copyright year changes:
  - vendor/github.com/mendersoftware/mendertesting/LICENSE
  - vendor/github.com/mendersoftware/mender-artifact/LICENSE

Remove hashes for the the following removed files:
  - vendor/github.com/mendersoftware/log/LICENSE
  - vendor/github.com/mendersoftware/scopestack/LICENSE

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.hash | 10 ++++------
 package/mender/mender.mk   |  4 +---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 6a258cf206..f1eef656fe 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,15 +1,13 @@
 # Locally computed:
-sha256 fe3567107d1dc9b3f3961f3a19d426bd7728fbc1525b72b8204765670234f4b6 2.2.0.tar.gz
+sha256  d7c885a34f7b7f9969970132411225895c136e22be0caaa6dd3e08ca4bb71ff9  2.3.0.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
-sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
-sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/log/LICENSE
-sha256  ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680  vendor/github.com/mendersoftware/scopestack/LICENSE
-sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 #
 # BSD 2 Clause license.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -38,4 +36,4 @@ sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256 8edc8cda9cc06270f44d2d75f7810a6ccc3d71c251cadb5e1a3065eb057a3132 LIC_FILES_CHKSUM.sha256
+sha256  39f8e574fa6d082b650a5d6159045cdec7c4662da6ccbd67271079904353b8d5  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 6543402f07..cd840b1e3f 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.2.0
+MENDER_VERSION = 2.3.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
@@ -15,8 +15,6 @@ MENDER_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/mendersoftware/mendertesting/LICENSE \
-	vendor/github.com/mendersoftware/log/LICENSE \
-	vendor/github.com/mendersoftware/scopestack/LICENSE \
 	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
