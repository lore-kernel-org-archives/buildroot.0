From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Oct 2020 22:07:17 +0200
Subject: [Buildroot] [PATCH 03/11] package/perl-gd: bump to version 2.73
In-Reply-To: <20201023200725.1407498-1-francois.perrad@gadz.org>
References: <20201023200725.1407498-1-francois.perrad@gadz.org>
Message-ID: <20201023200725.1407498-3-francois.perrad@gadz.org>
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
index bfa52b997..780b1d1e2 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ae960b9eed826d8d20e4c563151629f2  GD-2.72.tar.gz
-sha256  61d00713fcc3ba3c8fa8859025d86f97506e6af17e66d59e9396996773989104  GD-2.72.tar.gz
+md5  c2bf1ca56d15e33d2432e4d8ba5aeadf  GD-2.73.tar.gz
+sha256  491c9e73238522e2987e66725a20935f4268a3864202ecbaf4659a1691ba322b  GD-2.73.tar.gz
 
 # computed by scancpan
 sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index e73cf62a4..d34328f0d 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.72
+PERL_GD_VERSION = 2.73
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
-- 
2.25.1
