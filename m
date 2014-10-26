From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 13:56:01 +0100
Subject: [Buildroot] [git commit] perl-module-build: bump to version 0.4210
Message-ID: <20141026125630.2561DB0205@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4bff77d59a314dfe3d74e988ecb9aea7684d420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: drop empty HOST_PERL_MODULE_BUILD_DEPENDENCIES.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-module-build/perl-module-build.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 1eabe61..4fdb4c7 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4206
+PERL_MODULE_BUILD_VERSION = 0.4210
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
+PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 
 $(eval $(host-perl-package))
