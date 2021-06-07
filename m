From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Jun 2021 19:56:02 +0200
Subject: [Buildroot] [PATCH 4/6] package/perl-libwww-perl: bump to version
 6.54
In-Reply-To: <20210607175604.2850795-1-francois.perrad@gadz.org>
References: <20210607175604.2850795-1-francois.perrad@gadz.org>
Message-ID: <20210607175604.2850795-4-francois.perrad@gadz.org>
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
index 8081e127f..d04fb9699 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  33fdb6415018b8bf94242cace1b06479  libwww-perl-6.53.tar.gz
-sha256  9cbb7c688416a20c1aba9a32568504af1143ced58b572c502a1b2fb8a500f535  libwww-perl-6.53.tar.gz
+md5  aea3e2a207b128371db0ef0f86229667  libwww-perl-6.54.tar.gz
+sha256  76917708bd91fbb15eb5eece25ddd2ed1fa65a5b6b05a3ab2a7facce17dfc81d  libwww-perl-6.54.tar.gz
 
 # computed by scancpan
 sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index d96035e42..877ab9b36 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.53
+PERL_LIBWWW_PERL_VERSION = 6.54
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2
