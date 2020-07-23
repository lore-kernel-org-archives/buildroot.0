From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 22:04:13 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version to
 188d3bf
Message-ID: <20200723195951.80CC886D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=060599fc233b94dfec67630ecb62388de96c8b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 4a10536e74..0db5b7c83f 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f81fe28c636178645fb406cc87f543efa828ca896df856536f7b1b4ab54dfe0e  rpi-userland-6fb59736b1ae80fc62cddfe3309c800f72e1c07e.tar.gz
+sha256  7c58d6b4cdf65acef0ce1f441606df87e25745f78d74e11930383d03100aff4b  rpi-userland-188d3bfe4a0ac36b119a2cee35a6be8d0c68e09e.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index efb02f719f..9edc92344e 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 6fb59736b1ae80fc62cddfe3309c800f72e1c07e
+RPI_USERLAND_VERSION = 188d3bfe4a0ac36b119a2cee35a6be8d0c68e09e
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
