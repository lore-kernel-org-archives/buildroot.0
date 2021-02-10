From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:59:53 +0100
Subject: [Buildroot] [git commit] package/nghttp2: add NGHTTP2_CPE_ID_VENDOR
Message-ID: <20210210184152.36BA983976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ffdbebe0d277dc1a9520454e413ec48df4206aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:nghttp2:nghttp2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anghttp2%3Anghttp2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nghttp2/nghttp2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7b611c88fd..9190fa30d6 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -9,6 +9,7 @@ NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_V
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
 NGHTTP2_INSTALL_STAGING = YES
+NGHTTP2_CPE_ID_VENDOR = nghttp2
 NGHTTP2_DEPENDENCIES = host-pkgconf
 NGHTTP2_CONF_OPTS = --enable-lib-only
 
