From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 19 Oct 2016 16:23:08 +0200
Subject: [Buildroot] [PATCH 3/4] imx-usb-loader: bump version
In-Reply-To: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
Message-ID: <20161019142309.15628-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Main additions are:
- Support for i.MX6SX, i.MX6UL and i.MX7
- Support for secure booting on i.MX6/i.MX7
- Various bug fixes

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index aa8ff49..3e02038 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  1e7ee8af34e7d0a3b9761c25a4edfc7140d23132129818d288c74fc0d58796e5  imx-usb-loader-f96aee286ea17c832b7ec922dd76842deb5ce299.tar.gz
+sha256  40e1e36791e91366b13f57b16b32e75cf05e7177b2813f1bf2446419d0ed44eb  imx-usb-loader-9b0e81cf9511c3a27cf635407714caa2793b570c.tar.gz
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index c855625..0cd9637 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
+IMX_USB_LOADER_VERSION = 9b0e81cf9511c3a27cf635407714caa2793b570c
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPLv2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
-- 
2.9.3
