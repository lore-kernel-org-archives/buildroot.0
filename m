From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 20 May 2015 12:12:14 +0200
Subject: [Buildroot] [PATCH 03/13] libfslparser: bump version to 4.0.2
In-Reply-To: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432116744-25760-4-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New feature for 4.0.2 version:
* Enhanced Metadata supporting in MP4, MKV, AVI, ASF parser.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/550fb2de655f3bdbb057c41b55328b0ce2919bb9

This package has been implicitely tested through gstreamer as the 0.10 plugin
relies on it:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Regards,
Gary
---
 package/libfslparser/libfslparser.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.4
