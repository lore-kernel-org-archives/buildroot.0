From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 12 Jun 2018 17:06:34 +0200
Subject: [Buildroot] [PATCH 1/2] imx-usb-loader: bump revision to e539461
In-Reply-To: <20180612150635.32032-1-gary.bisson@boundarydevices.com>
References: <20180612150635.32032-1-gary.bisson@boundarydevices.com>
Message-ID: <20180612150635.32032-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This latest revision supports starting i.MX8MQ via USB recovery mode.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
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
-- 
2.17.1
