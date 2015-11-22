From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:26:09 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20151122213531.DCDAF81DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a8e96d05738421898c373ffaeb61ef3ab008ef2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build with glibc-2.22.

Also fixes hard-to-trigger deadlock in highly threaded case, and fix
libraries dependencies.

Misc minor improvements in test programs as well.

Fixes #8446.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: gamadril.dev at gmail.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index f1914a2..0a25b2d 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = b864a841e5a459a66a890c22b3a34127cd226238
+RPI_USERLAND_VERSION = 8306b7c757f4b8e8d9148789eeb64c666d9244a5
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
