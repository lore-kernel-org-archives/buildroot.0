From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:38:17 +0100
Subject: [Buildroot] [git commit] package/snort: add SNORT_CPE_ID_VENDOR
Message-ID: <20210202152051.62D8C812A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0c84eb0a3d27d710c5b69ded4d0dd8a7c62bc30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:snort:snort is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asnort%3Asnort

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/snort.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index c618b4a6af..412c69f838 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -8,6 +8,7 @@ SNORT_VERSION = 2.9.17
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
+SNORT_CPE_ID_VENDOR = snort
 
 SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
 
