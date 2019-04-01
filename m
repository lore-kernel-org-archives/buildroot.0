From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:56:40 +0200
Subject: [Buildroot] [git commit] package/perl-libwww-perl: bump to version
 6.38
Message-ID: <20190401200604.775118B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0946ae0d44d0fd2bd2089c4f94b6f0dc11d60952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index b6d8382af4..3d49792ff2 100644
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
index c3367e10c4..02164e503a 100644
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
