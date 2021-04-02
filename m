From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Apr 2021 19:38:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/perl-crypt-openssl-guess: bump
 version to 0.12
Message-ID: <20210402173826.908656-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash  | 6 +++---
 .../perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
index 327b06900a..e6d19cb681 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e768fe2c07826b0ac9ea604c79f93032 Crypt-OpenSSL-Guess-0.11.tar.gz
-sha256 aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167 Crypt-OpenSSL-Guess-0.11.tar.gz
+md5  9e86baf96828a38c967003a5e66f0c39  Crypt-OpenSSL-Guess-0.12.tar.gz
+sha256  0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d  Crypt-OpenSSL-Guess-0.12.tar.gz
 
 # computed by scancpan
-sha256 5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072 LICENSE
+sha256  5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072  LICENSE
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
index a53285165b..4f0898cf53 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.11
+PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.12
 PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
 PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
-- 
2.29.2
