From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Jul 2016 21:08:54 +0200
Subject: [Buildroot] [PATCH 5/6] perl-datetime-tiny: bump to version 1.06
In-Reply-To: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
References: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1469128135-10250-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
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
 
-- 
1.9.1
