From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:45:31 +0200
Subject: [Buildroot] [git commit] libfslparser: bump version to 4.0.2
Message-ID: <20150711112619.5C5A07FC81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91883109285bc9799bf4320a089b7022b8259ebc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New feature for 4.0.2 version:
* Enhanced Metadata supporting in MP4, MKV, AVI, ASF parser.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/550fb2de655f3bdbb057c41b55328b0ce2919bb9

This package has been implicitely tested through gstreamer as the 0.10 plugin
relies on it:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslparser/libfslparser.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 706a10e..50f0bf6 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = 3.0.11
+LIBFSLPARSER_VERSION = 4.0.2
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_INSTALL_STAGING = YES
