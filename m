From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:34:44 +0100
Subject: [Buildroot] [git commit] perl-module-build: bump to version 0.4220
Message-ID: <20170120194046.ACD7581EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ad575fef56043cf9693c3fcf559e36f714f7d36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-module-build/perl-module-build.hash | 4 ++--
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index d42dbad..0363ac5 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7e3b17e14b54036c5ac18c27f7955e79 Module-Build-0.4218.tar.gz
-sha256 1ef0aa529a3f296f894a5e79240a77d71be60dd595e8cad3a0d04c7ea187c0d0 Module-Build-0.4218.tar.gz
+md5    9df204e188462a4410d496f316c2c531 Module-Build-0.4220.tar.gz
+sha256 fb1207c7e799366f7a8adda3f135bf8141c4d6068505650d4db2b2d3ce34b5a2 Module-Build-0.4220.tar.gz
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 0effbac..3c27002 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4218
+PERL_MODULE_BUILD_VERSION = 0.4220
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
