From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Jul 2016 21:08:52 +0200
Subject: [Buildroot] [PATCH 3/6] perl-module-build: bump to version 0.4218
In-Reply-To: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
References: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1469128135-10250-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.hash | 4 ++--
 package/perl-module-build/perl-module-build.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index 558434b..d42dbad 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7b7ca5a47bef48c50c8b5906ca3ac7fb Module-Build-0.4214.tar.gz
-sha256 c579488918cf4db84954a550c475272b3c25f5100c739339e91a65d7c055dc3f Module-Build-0.4214.tar.gz
+md5    7e3b17e14b54036c5ac18c27f7955e79 Module-Build-0.4218.tar.gz
+sha256 1ef0aa529a3f296f894a5e79240a77d71be60dd595e8cad3a0d04c7ea187c0d0 Module-Build-0.4218.tar.gz
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 3caf302..0effbac 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4214
+PERL_MODULE_BUILD_VERSION = 0.4218
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
-- 
1.9.1
