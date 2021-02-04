From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 18:17:00 +0100
Subject: [Buildroot] [git commit] package/smartmontools: add
 SMARTMONTOOLS_CPE_ID_VENDOR
Message-ID: <20210204170218.D689C811D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7bbe8be8dee7965a79870adc22ebb624e5321e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:smartmontools:smartmontools is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asmartmontools%3Asmartmontools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/smartmontools/smartmontools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 9dc2f789cc..1f4448cb84 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -8,6 +8,7 @@ SMARTMONTOOLS_VERSION = 7.1
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
+SMARTMONTOOLS_CPE_ID_VENDOR = smartmontools
 # We're patching configure.ac
 SMARTMONTOOLS_AUTORECONF = YES
 
