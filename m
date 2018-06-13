From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:52:38 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: bump revision to e539461
Message-ID: <20180613205035.63EAD8856E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69d2b693c605082f2459c282947c99df517984ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This latest revision supports starting i.MX8MQ via USB recovery mode.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index e246ff85f2..8f59a3888b 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  717b64cec31f7e1167d4a31e4f511eea97ab80039dd435b7b183c6f41352213a imx-usb-loader-7e77787c83288a421080a9bf2f67063931f561be.tar.gz
+sha256  263dba6331206816890eaed0de7b0aa748c6e5300982fe6f31dcfe0df383ad62  imx-usb-loader-e5394615dd413c3823d5bd1de340933e16a8c07c.tar.gz
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 01a654e6cf..f0db57faac 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = 7e77787c83288a421080a9bf2f67063931f561be
+IMX_USB_LOADER_VERSION = e5394615dd413c3823d5bd1de340933e16a8c07c
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
