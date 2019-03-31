From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:44 +0200
Subject: [Buildroot] [PATCH 09/14] package/perl-lwp-mediatypes: bump to
 version 6.04
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-lwp-mediatypes/Config.in                | 2 +-
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash | 6 +++---
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
index 488109014..c1f58a6f3 100644
--- a/package/perl-lwp-mediatypes/Config.in
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	help
 	  guess media type for a file or a URL.
 
-	  https://metacpan.org/release/LWP-MediaTypes
+	  https://github.com/libwww-perl/lwp-mediatypes
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
index b459bb066..e125c0d57 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8c5f25fb64b974d22aff424476ba13c9 LWP-MediaTypes-6.02.tar.gz
-sha256 18790b0cc5f0a51468495c3847b16738f785a2d460403595001e0b932e5db676 LWP-MediaTypes-6.02.tar.gz
+md5    84b799a90c0d2ce52897a7cb4c0478d0 LWP-MediaTypes-6.04.tar.gz
+sha256 8f1bca12dab16a1c2a7c03a49c5e58cce41a6fec9519f0aadfba8dad997919d9 LWP-MediaTypes-6.04.tar.gz
 
 # computed by scancpan
-sha256 0844071ccbc184e7376c61051986c0b7bc3f0e6094c052ceaafd3d057673c17d README
+sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index 3ba2abc89..687a84427 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_LWP_MEDIATYPES_VERSION = 6.02
+PERL_LWP_MEDIATYPES_VERSION = 6.04
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
-PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
-PERL_LWP_MEDIATYPES_LICENSE_FILES = README
+PERL_LWP_MEDIATYPES_LICENSE_FILES = LICENSE
 PERL_LWP_MEDIATYPES_DISTNAME = LWP-MediaTypes
 
 $(eval $(perl-package))
-- 
2.17.1
