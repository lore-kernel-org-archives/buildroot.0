From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:46:55 +0200
Subject: [Buildroot] [git commit] perl-try-tiny: bump to version 0.24
Message-ID: <20160723125541.1EE4580AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89e8b6c8db8116ae07a7278133f3209f669351e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-try-tiny/Config.in          | 2 +-
 package/perl-try-tiny/perl-try-tiny.hash | 4 ++--
 package/perl-try-tiny/perl-try-tiny.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-try-tiny/Config.in b/package/perl-try-tiny/Config.in
index 7bd5396..ea25589 100644
--- a/package/perl-try-tiny/Config.in
+++ b/package/perl-try-tiny/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_TRY_TINY
 	help
 	  minimal try/catch with proper preservation of $@
 
-	  http://metacpan.org/release/Try-Tiny
+	  https://github.com/karenetheridge/Try-Tiny
diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index bff911f..dc44f18 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6769658bfbca241a470206c9a8819ff2 Try-Tiny-0.22.tar.gz
-sha256 60fba46f4693d33d54539104f9001df008dabb400b6837e9605c39a6ee6a1b19 Try-Tiny-0.22.tar.gz
+md5    1a12a51cfeb7e2c301e4ae093c7ecdfb Try-Tiny-0.24.tar.gz
+sha256 9b7a1af24c0256973d175369ebbdc25ec01e2452a97f2d3ab61481c826f38d81 Try-Tiny-0.24.tar.gz
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index 05cea54..f033197 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.22
+PERL_TRY_TINY_VERSION = 0.24
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
-PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-PERL_TRY_TINY_LICENSE_FILES = LICENSE
+PERL_TRY_TINY_LICENSE_FILES = README
 
 $(eval $(perl-package))
