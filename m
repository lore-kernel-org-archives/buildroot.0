From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:55:39 +0200
Subject: [Buildroot] [git commit] imx-kobs: switch to open source version
Message-ID: <20161019155542.847B781D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59b6eb96b0a34b3b36d725b49d463bbf41feb1dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools "kobs-ng" will be maintained as a open source project.
The repository location is https://github.com/NXPmicro/imx-kobs

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/c23736b3

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index b942bd3..258d08c 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1 +1 @@
-sha256	85171b46068ac47c42fedb8104167bf9afd33dd9527ed127e1ca2eb29d7a86bf  imx-kobs-5.4.tar.gz
+sha256	5b040de6e3db5d47371b311e7068380926827a7a6ef02e45fb2ba08b680d0ec5  imx-kobs-b402243a04e5a6760a860445e5ff6a931d86f794.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index b80d5bd..8f490c2 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = 5.4
-IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
+IMX_KOBS_VERSION = b402243a04e5a6760a860445e5ff6a931d86f794
+IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPLv2+
 IMX_KOBS_LICENSE_FILES = COPYING
 
