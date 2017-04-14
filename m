From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:24:58 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20170414202605.EB2A58042E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f135942f2c0424aaa6eee00b8f75efb776153746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 3e0dbfa..d4715fe 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9f7caa5fee77cef034551b23a7c12d78792ebd2feca7bcbc677da4daf2a98cf7 rpi-userland-f410ec051a3724934e3671315474d4b81424b0ef.tar.gz
+sha256 35b02340de04d8b91490e192b402ba23333a82b0c624e3e4475ba3240a2419a5 rpi-userland-f0642e3b58d8a140a3f7621630c15fbfa794b19d.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 632552c..ab05447 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = f410ec051a3724934e3671315474d4b81424b0ef
+RPI_USERLAND_VERSION = f0642e3b58d8a140a3f7621630c15fbfa794b19d
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
