From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:26 +0200
Subject: [Buildroot] [PATCH 13/18] perl-time-hires: bump to version 1.9746
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-13-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-time-hires/Config.in            | 2 +-
 package/perl-time-hires/perl-time-hires.hash | 4 ++--
 package/perl-time-hires/perl-time-hires.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-time-hires/Config.in b/package/perl-time-hires/Config.in
index 37bad71d8..fe933a4d8 100644
--- a/package/perl-time-hires/Config.in
+++ b/package/perl-time-hires/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PERL_TIME_HIRES
 	help
 	  High resolution alarm, sleep, gettimeofday, interval timers
 
-	  http://search.cpan.org/dist/Time-HiRes/HiRes.pm
+	  https://metacpan.org/release/Time-HiRes
 
 comment "perl-time-hires needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-time-hires/perl-time-hires.hash b/package/perl-time-hires/perl-time-hires.hash
index 185234045..210f6302d 100644
--- a/package/perl-time-hires/perl-time-hires.hash
+++ b/package/perl-time-hires/perl-time-hires.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    077e5d7eda1349f98c564026603f8a0a Time-HiRes-1.9726.tar.gz
-sha256 ff662ad9b1f6c75a149db7fa1bfc7a161ac8b271e5f3980345e08b734769109e Time-HiRes-1.9726.tar.gz
+md5    728dc2c2715313a056792191d7d0726c Time-HiRes-1.9746.tar.gz
+sha256 89408c81bb827bc908c98eec50071e6e1158f38fa462865ecc3dc03aebf5f596 Time-HiRes-1.9746.tar.gz
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index e1c32a2c4..7f52625fe 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_TIME_HIRES_VERSION = 1.9726
+PERL_TIME_HIRES_VERSION = 1.9746
 PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
-PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
+PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JH/JHI
 PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
 PERL_TIME_HIRES_LICENSE_FILES = README
 
-- 
2.11.0
