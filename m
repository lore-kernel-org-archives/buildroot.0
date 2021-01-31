From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:15:41 +0100
Subject: [Buildroot] [git commit] package/libcamera: bump version to ab72e66
Message-ID: <20210131215826.5F829814CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9b7b092cf34dc065a4b40268c18a9fe319f5e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 4a2d63e8a2..e2131f01ea 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  9e1eb5ac366eac6bc35f3600f9f5176723cb4af14b75ab23e196450bb28eeb67  libcamera-de5d03673c41f5f117d03c23495de5620fd6f42e-br1.tar.gz
+sha256  e9c02a370a15188163f247210cdcba4427d5bcf7b681c7fea5cb1dde23f71a15  libcamera-ab72e6641c56e876f91edee57a8969982a3ab9b7-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index ae074c2893..391dea7564 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = de5d03673c41f5f117d03c23495de5620fd6f42e
+LIBCAMERA_VERSION = ab72e6641c56e876f91edee57a8969982a3ab9b7
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
