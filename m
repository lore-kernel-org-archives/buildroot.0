From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:26:51 +0200
Subject: [Buildroot] [PATCH 06/11] perl-libwww-perl: bump to version 6.36
In-Reply-To: <20181026032656.9039-1-francois.perrad@gadz.org>
References: <20181026032656.9039-1-francois.perrad@gadz.org>
Message-ID: <20181026032656.9039-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 5606c926b..b6d8382af 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    725d6aac274575d614c3cc87e1a91eb8 libwww-perl-6.34.tar.gz
-sha256 260363fd4204c0ddf7cd76f7b70e22beb3b5186e4c346f250a59288b52dc114c libwww-perl-6.34.tar.gz
+md5    20062717e4084d2f56d84c7ab4c91ec1 libwww-perl-6.36.tar.gz
+sha256 75c034ab4b37f4b9506dc644300697505582cf9545bcf2e2079e7263f675290a libwww-perl-6.36.tar.gz
 
 # computed by scancpan
 sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index bd7781a3c..c3367e10c 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.34
+PERL_LIBWWW_PERL_VERSION = 6.36
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
