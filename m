From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 20:46:08 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bumps for misc fixes
	and improvements
Message-ID: <20140119195139.C13259C544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b955aa5bdd8f7e8b7ce349f7b7ea4a505d6805a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A slew of fixes and improvements, specially directed toward, but
not limited to, the sample codes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 8911ae0..35eaf24 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = d2c9f912da389c23ed27e81e940be3540f64fc59
+RPI_USERLAND_VERSION = 5cecd5ae71540a3c11270924251103b3b5c8513a
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
