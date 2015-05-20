From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 20 May 2015 12:12:13 +0200
Subject: [Buildroot] [PATCH 02/13] libfslcodec: bump version to 4.0.2
In-Reply-To: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432116744-25760-3-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/1a564bcf14c49356667dd91f90f07891cf2f9064

This package has been implicitely tested through gstreamer as the 0.10 plugin
relies on it:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm

Regards,
Gary
---
 package/libfslcodec/libfslcodec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index fe6f0ba..665588a 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = 3.0.11
+LIBFSLCODEC_VERSION = 4.0.2
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_INSTALL_STAGING = YES
-- 
2.1.4
