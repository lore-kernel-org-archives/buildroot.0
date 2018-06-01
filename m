From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  1 Jun 2018 18:24:38 +0200
Subject: [Buildroot] [PATCH] perl-libwww-perl: fix SITE
Message-ID: <20180601162438.22975-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/6f7745010ca589876a24d522bc0cb4a0dca26768/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 5 +++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 59164a83f..a9f3a3461 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    2e15c1c789ac9036c99d094e47e3da23 libwww-perl-6.33.tar.gz
 sha256 97417386f11f007ae129fe155b82fd8969473ce396a971a664c8ae6850c69b99 libwww-perl-6.33.tar.gz
-# Locally computed
-sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
+
+# computed by scancpan
+sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 9624929a9..427e4c1a9 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -6,7 +6,7 @@
 
 PERL_LIBWWW_PERL_VERSION = 6.33
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
-PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-encode-locale \
 	perl-file-listing \
-- 
2.17.0
