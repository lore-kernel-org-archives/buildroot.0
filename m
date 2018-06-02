From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 12:36:53 +0200
Subject: [Buildroot] [git commit] perl-libwww-perl: fix SITE
Message-ID: <20180602103746.9284182B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=000f8a63ed4953f9d6c0d40abec1c10641839364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6f7745010ca589876a24d522bc0cb4a0dca26768/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 5 +++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 59164a83f2..a9f3a34615 100644
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
index 9624929a92..427e4c1a97 100644
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
