From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:16 +0100
Subject: [Buildroot] [PATCH 10/14] perl-libwww-perl: bump to version 6.31
In-Reply-To: <20180117174520.29545-1-francois.perrad@gadz.org>
References: <20180117174520.29545-1-francois.perrad@gadz.org>
Message-ID: <20180117174520.29545-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 24e077d38..7ce085304 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    457bf4a4f40af3e2f43653329a9c6ab7 libwww-perl-6.26.tar.gz
-sha256 d0c5435275f8638ff36fff8f655ad2ccad1156e66cc47bfacfb9e44fc585b24f libwww-perl-6.26.tar.gz
+md5    688284bc6282562948c6916f9e8563b0 libwww-perl-6.31.tar.gz
+sha256 525d5386d39d1c1d7da8a0e9dd0cbab95cba2a4bfcfd9b83b257f49be4eecae3 libwww-perl-6.31.tar.gz
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index fd4857cf5..cdff6b41b 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.26
+PERL_LIBWWW_PERL_VERSION = 6.31
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
-PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-encode-locale \
 	perl-file-listing \
-- 
2.11.0
