From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:26:10 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/perl: add
 PERL_CPE_ID_VENDOR
Message-ID: <20210608075705.1C7B788766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb2f9b0d1ee7aad03e7d7cc0ad3c2777c381c27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:perl:perl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aperl%3Aperl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0aae08ee3da00ccfc52ce6c8722054549c28cf05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
