From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Jul 2016 21:08:50 +0200
Subject: [Buildroot] [PATCH 1/6] perl-mojolicious: bump to version 7.0
Message-ID: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/Config.in             | 2 +-
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
index 766d109..ebf0932 100644
--- a/package/perl-mojolicious/Config.in
+++ b/package/perl-mojolicious/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_MOJOLICIOUS
 	help
 	  Real-time web framework
 
-	  http://mojolicio.us
+	  http://mojolicious.org
diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 289f1f3..23a30e5 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8c189aed47bbe330584fb335251b3380 Mojolicious-6.25.tar.gz
-sha256 2e34d665a505ca9cbd4c55f010b17d184533b9ba2f92431d7c4126e0edc3a41a Mojolicious-6.25.tar.gz
+md5    91799c9c21e116dc438fdec1ede5a977 Mojolicious-7.0.tar.gz
+sha256 2da57d411aaf718d6b93deebd08d3c36e7f32ef66b6a539854f72119ad9b6bc2 Mojolicious-7.0.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 3ea828b..1bc31bb 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 6.25
+PERL_MOJOLICIOUS_VERSION = 7.0
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
1.9.1
