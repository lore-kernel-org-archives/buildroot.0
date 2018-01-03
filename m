From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed,  3 Jan 2018 19:38:38 +0100
Subject: [Buildroot] [PATCH 12/16] imx-kobs: bump revision to a0e9adce
In-Reply-To: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
Message-ID: <20180103183842.10182-13-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
- Fix compiler error with kernel headers >= 4.4
- Add i.MX8 platforms support

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 258d08c7e9..2ede0a9b48 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1 +1 @@
-sha256	5b040de6e3db5d47371b311e7068380926827a7a6ef02e45fb2ba08b680d0ec5  imx-kobs-b402243a04e5a6760a860445e5ff6a931d86f794.tar.gz
+sha256	5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index 897820df3f..d6a250cf72 100644
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
 
-- 
2.15.1
