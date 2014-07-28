From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Jul 2014 18:50:20 +0200
Subject: [Buildroot] [PATCH 3/3] perl-module-build: bump to version 0.4206
In-Reply-To: <1406566220-13271-1-git-send-email-francois.perrad@gadz.org>
References: <1406566220-13271-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1406566220-13271-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index a95278d..b147eb8 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4204
+PERL_MODULE_BUILD_VERSION = 0.4206
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
-- 
1.9.1
