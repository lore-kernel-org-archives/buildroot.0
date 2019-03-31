From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:43 +0200
Subject: [Buildroot] [PATCH 08/14] package/perl-libwww-perl: bump to version
 6.38
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-8-francois.perrad@gadz.org>
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
index b6d8382af..3d49792ff 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    20062717e4084d2f56d84c7ab4c91ec1 libwww-perl-6.36.tar.gz
-sha256 75c034ab4b37f4b9506dc644300697505582cf9545bcf2e2079e7263f675290a libwww-perl-6.36.tar.gz
+md5    db69a100747c8a9693f7d61d20ae354c libwww-perl-6.38.tar.gz
+sha256 a8e0849b8d2798fc45a2a5f2fe45c96cbbad5baf3bcbe64a3bf85f210e78708c libwww-perl-6.38.tar.gz
 
 # computed by scancpan
 sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index c3367e10c..02164e503 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.36
+PERL_LIBWWW_PERL_VERSION = 6.38
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
-PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
 PERL_LIBWWW_PERL_DISTNAME = libwww-perl
-- 
2.17.1
