From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:22:35 +0100
Subject: [Buildroot] [git commit] perl-gd: bump to version 2.70
Message-ID: <20190127102332.62F4C8E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b045ebf4d4880790431ec1529c4a43e18aedc6fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-gd/perl-gd.hash | 4 ++--
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index deeda0eb15..851aa6e57c 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    aa1488a54fd9baba7aadb53720675bdc GD-2.69.tar.gz
-sha256 ddb02d491cfd84d30448438c84239b0893d84e9576a90c3b5ed109420fae545d GD-2.69.tar.gz
+md5    d9596406f64e50b9ecef8d7cfbf0d99b GD-2.70.tar.gz
+sha256 66b26a322e1fd82ef874721dd5274effcc60eb0c0f3481bf88ddf91529b633e2 GD-2.70.tar.gz
 
 # computed by scancpan
 sha256 1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 751ea983eb..7557517131 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.69
+PERL_GD_VERSION = 2.70
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
