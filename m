From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 15 Mar 2020 19:09:40 +0100
Subject: [Buildroot] [PATCH v2] package/perl-module-build: bump to 0.4231
Message-ID: <20200315180940.13231-1-francois.perrad@gadz.org>
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
index a8a01f6ba..f5cab3689 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4229
+PERL_MODULE_BUILD_VERSION = 0.4231
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
