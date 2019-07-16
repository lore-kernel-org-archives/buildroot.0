From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 16 Jul 2019 11:12:57 -0400
Subject: [Buildroot] [PATCH 2/2] package/mender-artifact: bump to version
 3.0.1
In-Reply-To: <20190716151257.78244-1-aduskett@gmail.com>
References: <20190716151257.78244-1-aduskett@gmail.com>
Message-ID: <20190716151257.78244-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 9f75b850f9..6a3cf78f3a 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 b1b80822282a750c3f94cf4954ac4b1de5a86a7a9c1c7f2541aaf21417a0ff5f 3.0.0.tar.gz
+sha256 5dc663251d23c066bf238756d188d639dbfda00e2941a2fc2c4dc29aab29bfe9 3.0.1.tar.gz
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index f8b364166f..0a663ba891 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.0.0
+HOST_MENDER_ARTIFACT_VERSION = 3.0.1
 HOST_MENDER_ARTIFACT_SITE = https://github.com/mendersoftware/mender-artifact/archive
 HOST_MENDER_ARTIFACT_SOURCE = $(HOST_MENDER_ARTIFACT_VERSION).tar.gz
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
-- 
2.21.0
