From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 12 Apr 2018 21:32:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-mkimage: add dependency to
 host-zlib
Message-ID: <1523561529-8217-1-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
---
 package/imx-mkimage/imx-mkimage.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index cfb9e1a..6fd6aa3 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -9,6 +9,7 @@ IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	# Currently this only supports iMX8M. When more hardware is available
-- 
2.7.4
