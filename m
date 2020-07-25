From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:31:04 +0200
Subject: [Buildroot] [git commit] package/perl-gd: bump to version 2.72
Message-ID: <20200725213108.CA9768144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b066ffb9d1c38dd786947332a231a30db16fcd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-gd/perl-gd.hash | 6 +++---
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 5895cc3458..bfa52b9970 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1e2534e1d0db57d6aad438f15ca63253 GD-2.71.tar.gz
-sha256 451be4873b2ad7261cc5679698cd9d2e84dbdde4309971869fc7734b569b7ac7 GD-2.71.tar.gz
+md5  ae960b9eed826d8d20e4c563151629f2  GD-2.72.tar.gz
+sha256  61d00713fcc3ba3c8fa8859025d86f97506e6af17e66d59e9396996773989104  GD-2.72.tar.gz
 
 # computed by scancpan
-sha256 1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f LICENSE
+sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index d52ba1cce0..e73cf62a46 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.71
+PERL_GD_VERSION = 2.72
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
