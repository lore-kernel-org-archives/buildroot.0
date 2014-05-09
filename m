From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:29:51 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20140509143214.017889CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=067398c636bd0ac414c480f1cd05b55b84d87784
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow stereo modes to be selected for output; enable NTSC output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 7188dcf..f6e4443 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = a59842a068cbd19e262701f30014499e9070fbf6
+RPI_USERLAND_VERSION = eccb81050afd177da1923404b366c6226f29bfe0
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
