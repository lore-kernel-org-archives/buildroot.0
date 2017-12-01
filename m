From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:41 -0000
Subject: [Buildroot] [git commit] imx-usb-loader: bump to latest commit
Message-ID: <20171201205315.783B2810A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e57335cec2afe1aac395018c988e8946f8c76207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest commit is from Oct 5, 2017. This adds support for the i.MX7
family.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 +-
 package/imx-usb-loader/imx-usb-loader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index 6cb5811..e246ff8 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  5232292cb1ad853905357de59ed251b57060562dc8d7f1cce0bb6c0c8d280dae  imx-usb-loader-f04f225ebc1c38e81eb24745333c8622deda6b49.tar.gz
+sha256  717b64cec31f7e1167d4a31e4f511eea97ab80039dd435b7b183c6f41352213a imx-usb-loader-7e77787c83288a421080a9bf2f67063931f561be.tar.gz
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 7593e3c..946a1f3 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = f04f225ebc1c38e81eb24745333c8622deda6b49
+IMX_USB_LOADER_VERSION = 7e77787c83288a421080a9bf2f67063931f561be
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
