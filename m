From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:46:56 +0200
Subject: [Buildroot] [git commit] perl-datetime-tiny: bump to version 1.06
Message-ID: <20160723125541.2B06580AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01070c56c2071adf64f0a936df71556ac02668a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-datetime-tiny/Config.in               | 4 ++--
 package/perl-datetime-tiny/perl-datetime-tiny.hash | 4 ++--
 package/perl-datetime-tiny/perl-datetime-tiny.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-datetime-tiny/Config.in b/package/perl-datetime-tiny/Config.in
index e84db8b..7721c07 100644
--- a/package/perl-datetime-tiny/Config.in
+++ b/package/perl-datetime-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DATETIME_TINY
 	bool "perl-datetime-tiny"
 	help
-	  A datetime object with as little code as possible
+	  A date object, with as little code as possible
 
-	  https://metacpan.org/release/DateTime-Tiny
+	  https://github.com/dagolden/DateTime-Tiny
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.hash b/package/perl-datetime-tiny/perl-datetime-tiny.hash
index e498edb..68f2c02 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.hash
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9e7e4fe588445023763df113d3f2345f DateTime-Tiny-1.04.tar.gz
-sha256 68137c8ab3ca2a7f8a5fcea20f94b2f82bc2c7c36bb45063dbd81faadf0c7881 DateTime-Tiny-1.04.tar.gz
+md5    736be4b3e8171f4a029fb6ac3712a9b4 DateTime-Tiny-1.06.tar.gz
+sha256 bd725df481d7223ee787e154c116098b08a129f55e0763194b07ebea3dda33ec DateTime-Tiny-1.06.tar.gz
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index bf3b7d9..5758973 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_DATETIME_TINY_VERSION = 1.04
+PERL_DATETIME_TINY_VERSION = 1.06
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
-PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
+PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_DATETIME_TINY_LICENSE = Artistic or GPLv1+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
 
