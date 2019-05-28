From: deinok at deinok.com <deinok@deinok.com>
Date: Tue, 28 May 2019 10:52:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: bump version to
 3.0.0
Message-ID: <20190528085201.9572-1-deinok@deinok.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: deinok <deinok@deinok.com>

Signed-off-by: deinok <deinok@deinok.com>
---
 package/mender-artifact/mender-artifact.hash | 2 +-
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index d44244d31c..06b317f55e 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 fde448af4811600a130b243d59e21b1f9cdd60fd991bd418246c913ebf945206 2.4.0.tar.gz
+sha256 b1b80822282a750c3f94cf4954ac4b1de5a86a7a9c1c7f2541aaf21417a0ff5f 3.0.0.tar.gz
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 90d0071d1a..41b7bd8040 100644
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
-- 
2.17.1
