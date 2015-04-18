From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:00:40 +0200
Subject: [Buildroot] [git commit] perl-path-tiny: bump to version 0.068
Message-ID: <20150418133114.3B42B7FA94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a9c2f776f4b6714a933e608aaca205ba06ed01b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-path-tiny/perl-path-tiny.hash |    4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 7c3381d..91c1d1e 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b82cb206a44b7408b11b991001c45e49 Path-Tiny-0.061.tar.gz
-sha256 e8290aac8c0623eea1b20b4a9d9a1be08db7f5a92ea51a514677964f3fa01cca Path-Tiny-0.061.tar.gz
+md5    76e99fd1bb615f56954025ae636c6233 Path-Tiny-0.068.tar.gz
+sha256 a331fbd855a6216877c643c4cae4bf7edfdf7e13cd8142d2cb2d12eafdebaee0 Path-Tiny-0.068.tar.gz
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 248e30c..534453b 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.061
+PERL_PATH_TINY_VERSION = 0.068
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_DEPENDENCIES = perl
