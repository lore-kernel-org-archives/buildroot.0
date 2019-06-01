From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:07:20 +0200
Subject: [Buildroot] [git commit] package/mender-artifact: bump version to
 3.0.0
Message-ID: <20190602201238.18C1A81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=069e6de63fc252fd7add9763c76bb61de954ec1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two license files are changed, with just a copyright year update.

A new license file is added, as it is listed in
LIC_FILES_CHKSUM.sha256.

Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
[Thomas: fix license file hashes, add a missing license file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-artifact/mender-artifact.hash | 7 ++++---
 package/mender-artifact/mender-artifact.mk   | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index d44244d31c..9f75b850f9 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 fde448af4811600a130b243d59e21b1f9cdd60fd991bd418246c913ebf945206 2.4.0.tar.gz
+sha256 b1b80822282a750c3f94cf4954ac4b1de5a86a7a9c1c7f2541aaf21417a0ff5f 3.0.0.tar.gz
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -7,8 +7,8 @@ sha256 fde448af4811600a130b243d59e21b1f9cdd60fd991bd418246c913ebf945206 2.4.0.ta
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
-sha256 ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680 vendor/github.com/mendersoftware/mendertesting/LICENSE
+sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
+sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 vendor/github.com/mendersoftware/mendertesting/LICENSE
 #
 # BSD 2 Clause licenses.
 sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/github.com/pkg/errors/LICENSE
@@ -17,6 +17,7 @@ sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/g
 sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477 vendor/github.com/pmezard/go-difflib/LICENSE
 sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/sys/LICENSE
 sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/crypto/LICENSE
+sha256 a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a vendor/github.com/mendersoftware/go-liblzma/LICENSE
 #
 # ISC licenses.
 sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/github.com/davecgh/go-spew/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 90d0071d1a..7ca8e7280f 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 2.4.0
+HOST_MENDER_ARTIFACT_VERSION = 3.0.0
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
@@ -16,6 +16,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/golang.org/x/crypto/LICENSE \
+	vendor/github.com/mendersoftware/go-liblzma/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
