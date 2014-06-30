From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:07 +0200
Subject: [Buildroot] [PATCH 07/14] libfslcodec: bump to version 3.0.11
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <26d037fda5126121977af62baf7601076db1f529.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

This package version is now independent from freescale-imx package.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
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
1.9.1
