From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:42:18 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/gutenprint: add
 GUTENPRINT_CPE_ID_VENDOR
Message-ID: <20210326222258.DD5A07FD2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea70d89250709927dacd0beac2fac3b3bd336ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gutenprint_project:gutenprint is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agutenprint_project%3Agutenprint

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9462869f271ddb4cfd7a19a59a082fc2f4a6f6d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gutenprint/gutenprint.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 9cb80c3e95..b0fcd5a598 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -10,6 +10,7 @@ GUTENPRINT_SITE = http://downloads.sourceforge.net/project/gimp-print/gutenprint
 GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPL-2.0+
 GUTENPRINT_LICENSE_FILES = COPYING
+GUTENPRINT_CPE_ID_VENDOR = gutenprint_project
 
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
