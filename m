From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:21:34 +0200
Subject: [Buildroot] [git commit branch/next] perl-path-tiny: bump to
	version 0.072
Message-ID: <20150808105641.EC9147FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b23950eb03e7d26ae6410e27ac97d94684137a5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-path-tiny/perl-path-tiny.hash |    4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 91c1d1e..a62c165 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    76e99fd1bb615f56954025ae636c6233 Path-Tiny-0.068.tar.gz
-sha256 a331fbd855a6216877c643c4cae4bf7edfdf7e13cd8142d2cb2d12eafdebaee0 Path-Tiny-0.068.tar.gz
+md5    840696b295230682c727297c87fe42d6 Path-Tiny-0.072.tar.gz
+sha256 d7507c7822d4f7f60a5329d26c8afce31022cd92d02b011e367cc6a1eeae6981 Path-Tiny-0.072.tar.gz
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 534453b..71e2e43 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.068
+PERL_PATH_TINY_VERSION = 0.072
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_DEPENDENCIES = perl
