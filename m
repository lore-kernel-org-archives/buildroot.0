From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:51:28 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version to
 f73fca0
Message-ID: <20200920134223.450AD8875D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad9a5eed8f5ad7af81e6d329b12bda1b395a4d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 0db5b7c83f..83d7fce54f 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c58d6b4cdf65acef0ce1f441606df87e25745f78d74e11930383d03100aff4b  rpi-userland-188d3bfe4a0ac36b119a2cee35a6be8d0c68e09e.tar.gz
+sha256  024cafd2f4428e96bff1d29a782db1d484d4f1835f64097ca1bd0dc38f75e84f  rpi-userland-f73fca015d421b763936667a0b58fe5024d59921.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9edc92344e..4cfd5cb832 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 188d3bfe4a0ac36b119a2cee35a6be8d0c68e09e
+RPI_USERLAND_VERSION = f73fca015d421b763936667a0b58fe5024d59921
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
