From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:10:00 +0200
Subject: [Buildroot] [git commit] libfslparser: bump to version 3.0.11
Message-ID: <20140715211144.E71EB9CE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cfdce3ca0094a6dd8dcabfd4f1948485501d314
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package version is now independent from freescale-imx package.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfslparser/libfslparser.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
index 0d92e02..d52b151 100644
--- a/package/libfslparser/libfslparser.mk
+++ b/package/libfslparser/libfslparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLPARSER_VERSION = $(FREESCALE_IMX_VERSION)
+LIBFSLPARSER_VERSION = 3.0.11
 LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
