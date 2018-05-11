From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:02:45 +0200
Subject: [Buildroot] [git commit branch/next] package/perl-libwww-perl: bump
 version to 6.33
Message-ID: <20180511200232.28A728C9DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=901f7250f473fa08d2fae733a07b006ab329a0ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 ++++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 7ce0853049..59164a83f2 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    688284bc6282562948c6916f9e8563b0 libwww-perl-6.31.tar.gz
-sha256 525d5386d39d1c1d7da8a0e9dd0cbab95cba2a4bfcfd9b83b257f49be4eecae3 libwww-perl-6.31.tar.gz
+md5    2e15c1c789ac9036c99d094e47e3da23 libwww-perl-6.33.tar.gz
+sha256 97417386f11f007ae129fe155b82fd8969473ce396a971a664c8ae6850c69b99 libwww-perl-6.33.tar.gz
+# Locally computed
+sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index cdff6b41b4..9624929a92 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.31
+PERL_LIBWWW_PERL_VERSION = 6.33
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_DEPENDENCIES = \
