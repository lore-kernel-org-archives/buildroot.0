From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:37:44 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version to
 97bc818
Message-ID: <20210703210505.733848F6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d86f7f14157895801b7279ac49fa98ad8d12d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 91f1f0a964..4a0a8cb9d0 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  61b5c22789bf3d7e2725588529bc417275be47071b76e701673ea26963c20328  rpi-userland-45a0022ac64b4d0788def3c5230c972430f6fc23.tar.gz
+sha256  d67def03931215f41b741aed5a3a1bc2bd62fa33f5cc14692e9a4d65f2e0ea27  rpi-userland-97bc8180ad682b004ea224d1db7b8e108eda4397.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 4e57fbadbf..4f249d7bb8 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 45a0022ac64b4d0788def3c5230c972430f6fc23
+RPI_USERLAND_VERSION = 97bc8180ad682b004ea224d1db7b8e108eda4397
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
