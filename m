From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:54:24 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump revision
Message-ID: <20140414185513.344C89C03F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70fada8195876c5088a9af09c207d5c46b2147b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes and enhancements for:
  - camera : preview, white balance, padding-removal
  - encoder: save inline motion vectors
  - misc   : locking in GPU<->CPU dialog (?), tvservice eye-candy

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3c20516..7188dcf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 58ab02e820df719440816534f4534ab1dfd66ce6
+RPI_USERLAND_VERSION = a59842a068cbd19e262701f30014499e9070fbf6
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
