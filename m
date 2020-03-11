From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:52 +0100
Subject: [Buildroot] [PATCH 06/10] package/perl-module-build: bump to 0.4231
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.hash | 4 ++--
 package/perl-module-build/perl-module-build.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index 2af1a1ac8..aad0b78e3 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1447d9e02e63f7a1643986789a8f1ba9 Module-Build-0.4229.tar.gz
-sha256 1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18 Module-Build-0.4229.tar.gz
+md5    066b193e461d7dfe1eca17a139353001 Module-Build-0.4231.tar.gz
+sha256 7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717 Module-Build-0.4231.tar.gz
 
 # computed by scancpan
 sha256 f35ac2cc6b808a38c42c2d230b875217b0a24bb51e5a497ebb630cbb3d806c3e LICENSE
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index a8a01f6ba..7f54f4d7e 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4229
+PERL_MODULE_BUILD_VERSION = 0.4231
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 PERL_MODULE_BUILD_DISTNAME = Module-Build
 
+$(eval $(perl-package))
 $(eval $(host-perl-package))
-- 
2.20.1
