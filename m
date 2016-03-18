From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:22:15 +0100
Subject: [Buildroot] [git commit] imx-kobs: bump to version 5.3
Message-ID: <20160318223205.58DB280800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02c6af2a4b9ec3d1aea3f4046a22088fdb9cc887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- add new feature to read bch geometry setting from debugfs, it provides
the feasibility to support large oob NAND devices.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/9953874c

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 477f231..09d42ed 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 28c7356187ae26a2b37fb37a4b7bfdb63b3628b72d737d897ae6d5b969fbb51a  imx-kobs-5.1.tar.gz
+sha256	45f729fc2b49556f1ca9df778f52bf5cc749cfe53664c8206daab29991c5f6c1  imx-kobs-5.3.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index bf01567..cc4721f 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = 5.1
+IMX_KOBS_VERSION = 5.3
 IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
 IMX_KOBS_LICENSE = GPLv2+
 IMX_KOBS_LICENSE_FILES = COPYING
