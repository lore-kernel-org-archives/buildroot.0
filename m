From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:21:40 +0200
Subject: [Buildroot] [git commit] perl-uri: bump to version 1.68
Message-ID: <20150726162156.84C5981D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=183d95c83c734c554c8bf976492d16710024da8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-uri/perl-uri.hash |    4 ++--
 package/perl-uri/perl-uri.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index da33416..ea8de44 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d0ef53b6c63bcc02ba55f405c30741e3 URI-1.67.tar.gz
-sha256 7088d43d5f4902becfa5e0627751f5e6d0e0bdd1637b2d39e70ce807068a274e URI-1.67.tar.gz
+md5    4a954ab8d79f831616ca817ba4b26cb9 URI-1.68.tar.gz
+sha256 c840d30f7657bfd4b2acbb311bd764232911cd3dc97e92415fbd0a242185c358 URI-1.68.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 421a89f..f1aecb0 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.67
+PERL_URI_VERSION = 1.68
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_DEPENDENCIES = perl
 PERL_URI_LICENSE = Artistic or GPLv1+
-PERL_URI_LICENSE_FILES = README
+PERL_URI_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
