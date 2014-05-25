From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:37:02 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20140525204125.8D3A99CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=584e90074d8fe0494f4d430450d6db163c0df496
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Important fix to EGL surface validation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 690fd1e..8b225ba 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = eccb81050afd177da1923404b366c6226f29bfe0
+RPI_USERLAND_VERSION = 4855a45b118cb7b97b83e5160551db9813487c91
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
