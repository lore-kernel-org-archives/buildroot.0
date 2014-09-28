From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:58:41 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump revision for
	fixes + enhancements
Message-ID: <20140928205919.DA4C29D30E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0277d3dbbfc379cdf03b470f7542cdb4d9f70845
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 74a0056..044a60e 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe
+RPI_USERLAND_VERSION = ffcc4bd7c4875b71376c4240116e251652c9bec0
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
