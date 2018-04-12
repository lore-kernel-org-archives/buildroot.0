From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:42:57 +0200
Subject: [Buildroot] [git commit] package/imx-mkimage: add dependency to
 host-zlib
Message-ID: <20180412194321.42D4883F0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f593067b5cd807a8899ba401825b8d0180155cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/00d284b4841c7ec89475d509d5b8a8df8437ee3a/

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-mkimage/imx-mkimage.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index cfb9e1ae8c..6fd6aa39b0 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -9,6 +9,7 @@ IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
+HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	# Currently this only supports iMX8M. When more hardware is available
