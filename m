From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:54:06 +0100
Subject: [Buildroot] [git commit] perl-crypt-openssl-random: bump to version
	0.11
Message-ID: <20151025210816.24D00818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af092802cf99070fb99c42911274747db71a03e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-crypt-openssl-random/Config.in        |    3 +--
 .../perl-crypt-openssl-random.hash                 |    4 ++--
 .../perl-crypt-openssl-random.mk                   |    2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-random/Config.in b/package/perl-crypt-openssl-random/Config.in
index 2095cac..2ceb78d 100644
--- a/package/perl-crypt-openssl-random/Config.in
+++ b/package/perl-crypt-openssl-random/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
 	help
-	  Routines for accessing the OpenSSL pseudo-random number generator
-	  using the openSSL libraries
+	  OpenSSL/LibreSSL pseudo-random number generator access
 
 	  http://sourceforge.net/projects/perl-openssl/
 
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
index 2de6547..caacdc9 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b89ca9314c3a066b440a7bb3cb8d725d Crypt-OpenSSL-Random-0.10.tar.gz
-sha256 ae65d0ab6907edd1d67f87fdf0923ecae4d54c4c2e0ac9d9df97227903ccf18a Crypt-OpenSSL-Random-0.10.tar.gz
+md5    5d71337503e0356ce1ce1481504e5885 Crypt-OpenSSL-Random-0.11.tar.gz
+sha256 bb8c81c6a39b9b13a22d818ee9a746242f136f0fadceb6b9776ae615e7524c7a Crypt-OpenSSL-Random-0.11.tar.gz
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index 32c0a03..6152821 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.10
+PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.11
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
