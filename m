From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:59:36 +0100
Subject: [Buildroot] [git commit] package/perl-libwww-perl: bump to version
 6.41
Message-ID: <20191028225558.1F87C8C562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3cc2a61b4f7a0f48e09a2824ace9ca688f47e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 8a6d626fad..8614803f5a 100644
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
index 4bfcb0059e..2e32d096f1 100644
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
