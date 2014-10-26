From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Oct 2014 09:12:49 +0100
Subject: [Buildroot] [PATCH 1/6] perl-module-build: bump to version 0.4210
Message-ID: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 1eabe61..0274d28 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4206
+PERL_MODULE_BUILD_VERSION = 0.4210
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+HOST_PERL_MODULE_BUILD_DEPENDENCIES =
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
+PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 
 $(eval $(host-perl-package))
-- 
1.9.1
