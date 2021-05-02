From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  2 May 2021 11:54:18 +0200
Subject: [Buildroot] [PATCH v1] package/libcamera: bump version to 3a1f67a
Message-ID: <20210502095418.9547-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index e2131f01ea..78197b9aeb 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  e9c02a370a15188163f247210cdcba4427d5bcf7b681c7fea5cb1dde23f71a15  libcamera-ab72e6641c56e876f91edee57a8969982a3ab9b7-br1.tar.gz
+sha256  fa9efe38397392a338c0ed9d0bf3ac1480d4d1c96b0597e422f8b9fb36f43398  libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 391dea7564..11a6961da5 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = ab72e6641c56e876f91edee57a8969982a3ab9b7
+LIBCAMERA_VERSION = 3a1f67a8031ac5ad96a11d5dc8b2e8976290497b
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.31.1
