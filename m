From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 22:28:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: add MPV_CPE_ID_VENDOR
Message-ID: <20210522202854.283529-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mpv:mpv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ampv%3Ampv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 18f307d186..ca3b8c878a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -11,6 +11,7 @@ MPV_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
+MPV_CPE_ID_VENDOR = mpv
 
 MPV_NEEDS_EXTERNAL_WAF = YES
 
-- 
2.30.2
