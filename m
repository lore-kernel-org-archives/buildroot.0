From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:56:25 +0100
Subject: [Buildroot] [git commit] perl-module-build: bump to version 0.4214
Message-ID: <20151025210816.40B8A818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e8fc15c003882a569f0f7fc006f7e840a4162ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-module-build/perl-module-build.hash |    4 ++--
 package/perl-module-build/perl-module-build.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.hash b/package/perl-module-build/perl-module-build.hash
index 7da8793..558434b 100644
--- a/package/perl-module-build/perl-module-build.hash
+++ b/package/perl-module-build/perl-module-build.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    296e2ee8d7f7c6b4b178cda6919ba3c9 Module-Build-0.4208.tar.gz
-sha256 32eca47c494a5d2a826c30616270b0fc744315b7363223b54fdea2dcef635378 Module-Build-0.4208.tar.gz
+md5    7b7ca5a47bef48c50c8b5906ca3ac7fb Module-Build-0.4214.tar.gz
+sha256 c579488918cf4db84954a550c475272b3c25f5100c739339e91a65d7c055dc3f Module-Build-0.4214.tar.gz
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index aa6259a..3caf302 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_VERSION = 0.4208
+PERL_MODULE_BUILD_VERSION = 0.4214
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
