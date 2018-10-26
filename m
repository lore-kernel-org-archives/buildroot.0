From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:26:46 +0200
Subject: [Buildroot] [PATCH 01/11] perl-crypt-openssl-rsa: bump to version
 0.31
Message-ID: <20181026032656.9039-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash | 4 ++--
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
index 0d101d7bb..fe2a57858 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    10bca2fc6d0ba1aa329f227424ae87d5 Crypt-OpenSSL-RSA-0.30.tar.gz
-sha256 23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac Crypt-OpenSSL-RSA-0.30.tar.gz
+md5    d33681e19d2094df7c26bc7a4509265e Crypt-OpenSSL-RSA-0.31.tar.gz
+sha256 4173403ad4cf76732192099f833fbfbf3cd8104e0246b3844187ae384d2c5436 Crypt-OpenSSL-RSA-0.31.tar.gz
 
 # computed by scancpan
 sha256 8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a LICENSE
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 0edcb2236..b16152342 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RSA_VERSION = 0.30
+PERL_CRYPT_OPENSSL_RSA_VERSION = 0.31
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
-- 
2.17.1
