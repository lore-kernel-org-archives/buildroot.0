From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:39:15 +0200
Subject: [Buildroot] [git commit branch/next] package/rpi-userland: bump
	version
Message-ID: <20150818123920.110517F971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e16f5da9d50f8f35b7d85b7313578006df142cce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes since last version:
 - early frame sequential 3D support,
 - add exposure=off option,
 - khronos: merge with more recent header file,
 - vchiq: better error handling.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 403409d..f1914a2 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = b834074d0c0d9d7e64c133ab14ed691999cee990
+RPI_USERLAND_VERSION = b864a841e5a459a66a890c22b3a34127cd226238
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
