From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 18 Jun 2014 21:03:57 -0700
Subject: [Buildroot] [PATCH 3/5] libfslcodec: bump to version 3.0.11
In-Reply-To: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403150639-29382-4-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/libfslcodec/libfslcodec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfslcodec/libfslcodec.mk b/package/libfslcodec/libfslcodec.mk
index d52158c..1a364bb 100644
--- a/package/libfslcodec/libfslcodec.mk
+++ b/package/libfslcodec/libfslcodec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLCODEC_VERSION = $(FREESCALE_IMX_VERSION)
+LIBFSLCODEC_VERSION = 3.0.11
 LIBFSLCODEC_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
-- 
2.0.0
