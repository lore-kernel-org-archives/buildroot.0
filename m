From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:08:39 +0200
Subject: [Buildroot] [git commit] rpi-userland: fix github tarball to use
	commit id
Message-ID: <20130606211257.D46B19A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8645437c0cc0fffa6962030ddd90698ab917891e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index cdf0bf9..45ad64b 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RPI_USERLAND_VERSION = 5e9a740a88a889dfc8a18bb1b00c17e5dd9d0108
-RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
+RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
