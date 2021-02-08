From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 16:22:08 +0100
Subject: [Buildroot] [git commit] package/brotli: add BROTLI_CPE_ID_VENDOR
Message-ID: <20210208150703.7CF5782DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c74f82f1600ce6687128dd102485e12bfde7ccdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:google:brotli is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agoogle%3Abrotli

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brotli/brotli.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 5209d3186b..43c8524c0b 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -9,6 +9,7 @@ BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
 BROTLI_LICENSE_FILES = LICENSE
+BROTLI_CPE_ID_VENDOR = google
 BROTLI_INSTALL_STAGING = YES
 BROTLI_CONF_OPTS = \
 	-DBROTLI_DISABLE_TESTS=ON \
