From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 22:59:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl: add PERL_CPE_ID_VENDOR
Message-ID: <20210523205934.1530579-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:perl:perl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aperl%3Aperl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a77686f951..f661fef013 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -11,6 +11,7 @@ PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
+PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-- 
2.30.2
