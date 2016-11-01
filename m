From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 19:27:51 +0100
Subject: [Buildroot] [git commit] imx-parser: bump to version 4.1.4
Message-ID: <20161101182817.14A4E801D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3761678a6eb84a97bb90931bea838e503ec63a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Update license checksum to align to EULA
- Updates for coverity, memory leaks, corrupted content

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/4bbd9dc4

Implicitly tested through gstreamer as the 0.10 plugin relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-parser/imx-parser.hash | 2 +-
 package/freescale-imx/imx-parser/imx-parser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-parser/imx-parser.hash b/package/freescale-imx/imx-parser/imx-parser.hash
index 2193c66..f6e8233 100644
--- a/package/freescale-imx/imx-parser/imx-parser.hash
+++ b/package/freescale-imx/imx-parser/imx-parser.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	1bec0101843db2e95d61e3dbe9e35172d874e54be19cc5d8bf72a735d5e3236f  imx-parser-4.0.9.bin
+sha256	d3a03e60780bbbd0c92932f60bd34d2fe14ffecf6aa6b810723c3edf798cad1f  imx-parser-4.1.4.bin
diff --git a/package/freescale-imx/imx-parser/imx-parser.mk b/package/freescale-imx/imx-parser/imx-parser.mk
index e579789..a57647c 100644
--- a/package/freescale-imx/imx-parser/imx-parser.mk
+++ b/package/freescale-imx/imx-parser/imx-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_PARSER_VERSION = 4.0.9
+IMX_PARSER_VERSION = 4.1.4
 IMX_PARSER_SITE = $(FREESCALE_IMX_SITE)
 IMX_PARSER_SOURCE = imx-parser-$(IMX_PARSER_VERSION).bin
 IMX_PARSER_INSTALL_STAGING = YES
