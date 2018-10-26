From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:26:49 +0200
Subject: [Buildroot] [PATCH 04/11] perl-gd: bump to version 2.69
In-Reply-To: <20181026032656.9039-1-francois.perrad@gadz.org>
References: <20181026032656.9039-1-francois.perrad@gadz.org>
Message-ID: <20181026032656.9039-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd.hash | 4 ++--
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index c1990e494..deeda0eb1 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b18bf9698608699309dfb3d09e260c63 GD-2.68.tar.gz
-sha256 6aa3de0d49c22011d412789be664c46520b8d4eb4920fe30dbac501b88515e5c GD-2.68.tar.gz
+md5    aa1488a54fd9baba7aadb53720675bdc GD-2.69.tar.gz
+sha256 ddb02d491cfd84d30448438c84239b0893d84e9576a90c3b5ed109420fae545d GD-2.69.tar.gz
 
 # computed by scancpan
 sha256 1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index b059dd4c2..751ea983e 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.68
+PERL_GD_VERSION = 2.69
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
-- 
2.17.1
