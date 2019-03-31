From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:41 +0200
Subject: [Buildroot] [PATCH 06/14] package/perl-gd: bump to version 2.71
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-6-francois.perrad@gadz.org>
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
index 851aa6e57..5895cc345 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d9596406f64e50b9ecef8d7cfbf0d99b GD-2.70.tar.gz
-sha256 66b26a322e1fd82ef874721dd5274effcc60eb0c0f3481bf88ddf91529b633e2 GD-2.70.tar.gz
+md5    1e2534e1d0db57d6aad438f15ca63253 GD-2.71.tar.gz
+sha256 451be4873b2ad7261cc5679698cd9d2e84dbdde4309971869fc7734b569b7ac7 GD-2.71.tar.gz
 
 # computed by scancpan
 sha256 1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 755751713..d52ba1cce 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.70
+PERL_GD_VERSION = 2.71
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
-- 
2.17.1
