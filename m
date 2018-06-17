From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:01:16 +0200
Subject: [Buildroot] [git commit] perl-gd: bump to version 2.68
Message-ID: <20180617115903.43D5E81344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f155bb619f99fe1586f5b71af2abd79632fd44cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-gd/perl-gd.hash | 7 +++++--
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index ad30e0a170..c1990e4949 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b9cfc5a677b5e9fa607be1379f789855 GD-2.67.tar.gz
-sha256 93a47c2259979cf20c6a39c9e03e0da87a9a855d8b650fb68a08d16a96684246 GD-2.67.tar.gz
+md5    b18bf9698608699309dfb3d09e260c63 GD-2.68.tar.gz
+sha256 6aa3de0d49c22011d412789be664c46520b8d4eb4920fe30dbac501b88515e5c GD-2.68.tar.gz
+
+# computed by scancpan
+sha256 1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 81070a939d..3686e9c871 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.67
+PERL_GD_VERSION = 2.68
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
