From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 21:24:46 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20140316205026.41D4D9BF67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47f36ec58d98aa2eabd70b3c020d178febe5a306
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

High frame rates and full FoV in camera code.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 69b6ee6..3b7d5b5 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 68a2cba184d2726327026429abfe033acf217384
+RPI_USERLAND_VERSION = 7beec2158da8229598f8e471ab5ca834078f5ad2
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
