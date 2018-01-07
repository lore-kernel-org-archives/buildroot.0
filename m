From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:38:45 +0100
Subject: [Buildroot] [git commit] imx-kobs: bump revision to a0e9adce
Message-ID: <20180107144906.59BFB802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=650e1639e2014ba126b017d2ef1f1998b7513f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Fix compiler error with kernel headers >= 4.4
- Add i.MX8 platforms support

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 258d08c..2ede0a9 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1 +1 @@
-sha256	5b040de6e3db5d47371b311e7068380926827a7a6ef02e45fb2ba08b680d0ec5  imx-kobs-b402243a04e5a6760a860445e5ff6a931d86f794.tar.gz
+sha256	5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 897820d..d6a250c 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = b402243a04e5a6760a860445e5ff6a931d86f794
-IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
+IMX_KOBS_VERSION = a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b
+IMX_KOBS_SITE = $(call github,codeauroraforum,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPL-2.0+
 IMX_KOBS_LICENSE_FILES = COPYING
 
