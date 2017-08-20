From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:20 +0200
Subject: [Buildroot] [PATCH 07/18] perl-module-build: bump to version 0.4224
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-7-francois.perrad@gadz.org>
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
index 0363ac576..17e8b4e5d 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9df204e188462a4410d496f316c2c531 Module-Build-0.4220.tar.gz
-sha256 fb1207c7e799366f7a8adda3f135bf8141c4d6068505650d4db2b2d3ce34b5a2 Module-Build-0.4220.tar.gz
+md5    b74c2f6e84b60aad3a3defd30b6f0f4d Module-Build-0.4224.tar.gz
+sha256 a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782 Module-Build-0.4224.tar.gz
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 080e8179e..42c9c1114 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4220
+PERL_MODULE_BUILD_VERSION = 0.4224
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
-- 
2.11.0
