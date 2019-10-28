From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Oct 2019 20:25:15 +0100
Subject: [Buildroot] [PATCH 3/8] package/perl-libwww-perl: bump to version
 6.41
In-Reply-To: <20191028192520.8656-1-francois.perrad@gadz.org>
References: <20191028192520.8656-1-francois.perrad@gadz.org>
Message-ID: <20191028192520.8656-3-francois.perrad@gadz.org>
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
index 8a6d626fa..8614803f5 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e6eec32d76fee9d8752efbd355e6e7bc libwww-perl-6.39.tar.gz
-sha256 9a8d7747938aa75d7d524c71574ae7f99ca66a5dac8255a7f7759f373e7774d5 libwww-perl-6.39.tar.gz
+md5    d1b867b29e71d399dd5ff56b9a469637 libwww-perl-6.41.tar.gz
+sha256 8e271add59a2b773839b902a58a9c955b42008700df93eae1aa37167483a064a libwww-perl-6.41.tar.gz
 
 # computed by scancpan
 sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 4bfcb0059..2e32d096f 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.39
+PERL_LIBWWW_PERL_VERSION = 6.41
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
