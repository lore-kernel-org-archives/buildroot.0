From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:41:02 +0200
Subject: [Buildroot] [git commit] perl-uri: bump to version 1.72
Message-ID: <20170902130619.39B4B81D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98e97d2f3e32a5d110bfabda9e0a338fe45b609a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-uri/Config.in     | 6 ++----
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
index 62a53f2..23e5c50 100644
--- a/package/perl-uri/Config.in
+++ b/package/perl-uri/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PERL_URI
 	bool "perl-uri"
 	help
-	  The module implements the URI class. Objects of this class represent
-	  Uniform Resource Identifier references as specified in RFC 2396 and
-	  updated by RFC 2732.
+	  Uniform Resource Identifiers (absolute and relative)
 
-	  https://github.com/libwww-perl/uri
+	  https://github.com/libwww-perl/URI
diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 8a265bf..a11924f 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    247c3da29a794f72730e01aa5a715daf URI-1.71.tar.gz
-sha256 9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115 URI-1.71.tar.gz
+md5    cd56d81ed429efaa97e7f3ff08851b48 URI-1.72.tar.gz
+sha256 35f14431d4b300de4be1163b0b5332de2d7fbda4f05ff1ed198a8e9330d40a32 URI-1.72.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index effeb16..75f374a 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.71
+PERL_URI_VERSION = 1.72
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPL-1.0+
