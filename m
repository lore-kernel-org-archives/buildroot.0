From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Oct 2019 10:37:50 -0700
Subject: [Buildroot] [PATCH 2/2] package/mender-artifact: bump to version
 3.2.0
In-Reply-To: <20191028173750.45261-1-aduskett@gmail.com>
References: <20191028173750.45261-1-aduskett@gmail.com>
Message-ID: <20191028173750.45261-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also moved License sha256sum.
  - vendor/github.com/mendersoftware/go-liblzma/LICENSE to
    vendor/github.com/remyoudompheng/go-liblzma/LICENSE

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 4 ++--
 package/mender-artifact/mender-artifact.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 6a3cf78f3a..8a927d1ca3 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 5dc663251d23c066bf238756d188d639dbfda00e2941a2fc2c4dc29aab29bfe9 3.0.1.tar.gz
+sha256 2be8946b4febf44b1e37cbaa1d1286de895bae8c5c17a5c6165e9509a02f40dc 3.2.0.tar.gz
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -17,7 +17,7 @@ sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86 vendor/g
 sha256 2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477 vendor/github.com/pmezard/go-difflib/LICENSE
 sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/sys/LICENSE
 sha256 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067 vendor/golang.org/x/crypto/LICENSE
-sha256 a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a vendor/github.com/mendersoftware/go-liblzma/LICENSE
+sha256 a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a vendor/github.com/remyoudompheng/go-liblzma/LICENSE
 #
 # ISC licenses.
 sha256 3525392c6db3b804af76980b2c560ee9ec1abdadd907d76a26091df7c78f3a25 vendor/github.com/davecgh/go-spew/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 0a663ba891..5ccaa31a9b 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.0.1
+HOST_MENDER_ARTIFACT_VERSION = 3.2.0
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
@@ -16,7 +16,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/golang.org/x/crypto/LICENSE \
-	vendor/github.com/mendersoftware/go-liblzma/LICENSE \
+	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
-- 
2.21.0
