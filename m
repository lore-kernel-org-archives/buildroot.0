From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:21 +0200
Subject: [Buildroot] [PATCH 03/10] package/perl-gd: bump to version 2.72
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd.hash | 6 +++---
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 5895cc345..bfa52b997 100644
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
index d52ba1cce..e73cf62a4 100644
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
-- 
2.25.1
