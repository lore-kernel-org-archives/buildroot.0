From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:48:16 +0200
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 1.010001
Message-ID: <20200425123632.ED9D38FF8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb339260a2939233b30dcdbeea63e70d56187caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 8263e14c9d..20974d2f0d 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    04194fe9673ef5504be9d50aa5d6782a Type-Tiny-1.008003.tar.gz
-sha256 a44e6e3ab29f05516d2a670de817278a7a06d55bce6f4ceaeb84ce032dcd00f5 Type-Tiny-1.008003.tar.gz
+md5  9d2d5ab2c5d6d2f98138ab14c5f529e3  Type-Tiny-1.010001.tar.gz
+sha256  f378663f62aaa7cf87f47b90f0951356d26a08468027da26962387998a6b1aae  Type-Tiny-1.010001.tar.gz
 
 # computed by scancpan
-sha256 7cf4a3f3f81896130c0bc8041fddd737052cdf28e1bd8af7046884f63f262e53 COPYRIGHT
-sha256 1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25 LICENSE
+sha256  8c466d4e49afea63822407988a7b7c77be0178bc398fe088fadffb5202c44a4a  COPYRIGHT
+sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index ea1290bb2a..9c89eb5daf 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.008003
+PERL_TYPE_TINY_VERSION = 1.010001
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
