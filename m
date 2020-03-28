From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 28 Mar 2020 15:26:11 -0700
Subject: [Buildroot] [PATCH 2/2] package/mender-artifact: bump version to
 3.3.0
In-Reply-To: <20200328222612.3717621-1-aduskett@gmail.com>
References: <20200328222612.3717621-1-aduskett@gmail.com>
Message-ID: <20200328222612.3717621-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update license file hash due to year change.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 26 ++++++++++----------
 package/mender-artifact/mender-artifact.mk   |  3 ++-
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 74ea5686c1..cd178483d1 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 62233e415399a32f4397cf9e2dfc1447db58b7ebd71379ee779b360140d5ab08 3.2.1.tar.gz
-sha256 68d145b900b4845834d49efe470d7e9ec7a3d9f175e72cb974f38c54b9172801 LIC_FILES_CHKSUM.sha256
+sha256 6b9fe6f427c43ac92e1fc88dc8c6cac323eaf9ea5854078a06c4313e090e83f8 3.3.0.tar.gz
+sha256 be22e200d0826c94bfd71cc5c1d4995449a6e3bd527090c1cfe953bc81427573 LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,22 +8,22 @@ sha256 68d145b900b4845834d49efe470d7e9ec7a3d9f175e72cb974f38c54b9172801 LIC_FILE
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
-sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  LICENSE
+sha256  beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2  vendor/github.com/mendersoftware/mendertesting/LICENSE
 #
 # BSD 2 Clause licenses.
-sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/github.com/pkg/errors/LICENSE
+sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 #
 # BSD 3 Clause licenses.
-sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477 vendor/github.com/pmezard/go-difflib/LICENSE
-sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/sys/LICENSE
-sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/crypto/LICENSE
-sha256 a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
+sha256  a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
 #
 # ISC licenses.
-sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/github.com/davecgh/go-spew/LICENSE
+sha256  3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25  vendor/github.com/davecgh/go-spew/LICENSE
 #
 # MIT licenses.
-sha256 402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f vendor/github.com/stretchr/testify/LICENSE
-sha256 da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7 vendor/github.com/urfave/cli/LICENSE
-sha256 51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b vendor/github.com/sirupsen/logrus/LICENSE
+sha256  402f39eed8a1851385d0703999aa9f23d067c2ea3e15c63c074e389cbf8f8f8f  vendor/github.com/stretchr/testify/LICENSE
+sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/LICENSE
+sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index f4a606653f..14cbe53d4c 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.2.1
+HOST_MENDER_ARTIFACT_VERSION = 3.3.0
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
@@ -21,6 +21,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE
+
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
-- 
2.25.1
