From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 18:48:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/jbig2dec: add JBIG2DEC_CPE_ID_VENDOR
Message-ID: <20210301174840.207510-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:artifex:jbig2dec is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aartifex%3Ajbig2dec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jbig2dec/jbig2dec.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
index 59fcddfc1c..8d881136ad 100644
--- a/package/jbig2dec/jbig2dec.mk
+++ b/package/jbig2dec/jbig2dec.mk
@@ -9,6 +9,7 @@ JBIG2DEC_SITE = \
 	https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530
 JBIG2DEC_LICENSE = AGPL-3.0+
 JBIG2DEC_LICENSE_FILES = LICENSE
+JBIG2DEC_CPE_ID_VENDOR = artifex
 JBIG2DEC_INSTALL_STAGING = YES
 # tarball is missing install-sh, install.sh, or shtool
 JBIG2DEC_AUTORECONF = YES
-- 
2.30.0
