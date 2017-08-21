From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 21 Aug 2017 16:48:01 +0200
Subject: [Buildroot] [PATCH] imx-usb-loader: bump to latest commit
Message-ID: <20170821144801.2349-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current commit is from Sep 23, 2016. Update to latest commit from
Jul 11, 2017 to add support for i.MX6ULL processors.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index 3e02038997..6cb581147f 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  40e1e36791e91366b13f57b16b32e75cf05e7177b2813f1bf2446419d0ed44eb  imx-usb-loader-9b0e81cf9511c3a27cf635407714caa2793b570c.tar.gz
+sha256  5232292cb1ad853905357de59ed251b57060562dc8d7f1cce0bb6c0c8d280dae  imx-usb-loader-f04f225ebc1c38e81eb24745333c8622deda6b49.tar.gz
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 685fa9d24a..7593e3ce7a 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = 9b0e81cf9511c3a27cf635407714caa2793b570c
+IMX_USB_LOADER_VERSION = f04f225ebc1c38e81eb24745333c8622deda6b49
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
-- 
2.14.1
