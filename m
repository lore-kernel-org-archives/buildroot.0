From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 10:37:04 -0700
Subject: [Buildroot] [PATCH 1/4] package/mender-artifact: bump version to
 3.4.0
Message-ID: <20200715173707.584226-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Update the following license file hashes due to copyright year changes:
  - vendor/github.com/mendersoftware/mendertesting/LICENSE
  - vendor/github.com/davecgh/go-spew/LICENSE
  - vendor/github.com/stretchr/testify/LICENSE

Add hashes for the the following new files:
  - vendor/github.com/minio/sha256-simd/LICENSE
  - vendor/gopkg.in/yaml.v2/LICENSE
  - vendor/github.com/klauspost/compress/LICENSE
  - vendor/github.com/russross/blackfriday/v2/LICENSE.txt
  - vendor/github.com/klauspost/pgzip/LICENSE
  - vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
  - vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 17 ++++++++++++-----
 package/mender-artifact/mender-artifact.mk   | 11 +++++++++--
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index cd178483d1..09e66617bb 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 6b9fe6f427c43ac92e1fc88dc8c6cac323eaf9ea5854078a06c4313e090e83f8 3.3.0.tar.gz
-sha256 be22e200d0826c94bfd71cc5c1d4995449a6e3bd527090c1cfe953bc81427573 LIC_FILES_CHKSUM.sha256
+sha256  c085479a6e2ae598687a15b646bfaaa68e5d76d08382bdcc4a27a9b4021d6540  3.4.0.tar.gz
+sha256  08b0209abb7e87bb1d21aca8a40693b7d29406d1edffd443f17c59d5d68f6467  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -9,7 +9,9 @@ sha256 be22e200d0826c94bfd71cc5c1d4995449a6e3bd527090c1cfe953bc81427573 LIC_FILE
 
 # Apache 2.0 licenses.
 sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
-sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  vendor/gopkg.in/yaml.v2/LICENSE
 #
 # BSD 2 Clause licenses.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -19,11 +21,16 @@ sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
 sha256  a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  16f848582e4b276a7392cd34496b7a33d6f65c0e190c163ff3a056a7c61219ce  vendor/github.com/klauspost/compress/LICENSE
+sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
 #
 # ISC licenses.
-sha256  3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25  vendor/github.com/davecgh/go-spew/LICENSE
+sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
 #
 # MIT licenses.
-sha256  402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENSE
+sha256  dad2b0b2cc2dbdbf95ad5d800ef7588956e74dc2479014829d42be295125c25d  vendor/github.com/stretchr/testify/LICENSE
 sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/LICENSE
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
+sha256  7709cc030f078b17809884f92f33a2016944e1180312dc3f1371b02313d313ed  vendor/github.com/klauspost/pgzip/LICENSE
+sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md
+sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 14cbe53d4c..c81ec9ba53 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.3.0
+HOST_MENDER_ARTIFACT_VERSION = 3.4.0
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
@@ -12,15 +12,22 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/mendersoftware/mendertesting/LICENSE \
+	vendor/github.com/minio/sha256-simd/LICENSE \
+	vendor/gopkg.in/yaml.v2/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/golang.org/x/crypto/LICENSE \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
+	vendor/github.com/klauspost/compress/LICENSE \
+	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
-	vendor/github.com/sirupsen/logrus/LICENSE
+	vendor/github.com/sirupsen/logrus/LICENSE \
+	vendor/github.com/klauspost/pgzip/LICENSE \
+	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
+	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-- 
2.26.2
