From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 21:24:43 +0200
Subject: [Buildroot] [git commit] package/perl-posix-strftime-compiler: bump
 to version 0.44
Message-ID: <20200903191701.32EDF87A66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0445a41900a07794ad6b09f657cf4ce8eb0e02f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash  | 6 +++---
 .../perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
index e8c5219c48..bdc6fd45a0 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c0a5f76b1b0ce9cdb90d627b017e6cf5 POSIX-strftime-Compiler-0.42.tar.gz
-sha256 26582bdd78b254bcc1c56d0b770fa280e8b8f70957c84dc44572ba4cacb0ac11 POSIX-strftime-Compiler-0.42.tar.gz
+md5  3a5ae7d56a5917410c1b661e01ed1a68  POSIX-strftime-Compiler-0.44.tar.gz
+sha256  dfd3c97398dcfe51c8236b85e3dc28035667b76531f7aa0a6535f3aa5405b35a  POSIX-strftime-Compiler-0.44.tar.gz
 
 # computed by scancpan
-sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
+sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
index d7e23d254f..c11ed58514 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.42
+PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.44
 PERL_POSIX_STRFTIME_COMPILER_SOURCE = POSIX-strftime-Compiler-$(PERL_POSIX_STRFTIME_COMPILER_VERSION).tar.gz
 PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
-PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build
+PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_POSIX_STRFTIME_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_POSIX_STRFTIME_COMPILER_LICENSE_FILES = LICENSE
 PERL_POSIX_STRFTIME_COMPILER_DISTNAME = POSIX-strftime-Compiler
