From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:12 +0100
Subject: [Buildroot] [PATCH 06/14] perl-time-hires: bump to version 1.9753
In-Reply-To: <20180117174520.29545-1-francois.perrad@gadz.org>
References: <20180117174520.29545-1-francois.perrad@gadz.org>
Message-ID: <20180117174520.29545-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-time-hires/perl-time-hires.hash | 4 ++--
 package/perl-time-hires/perl-time-hires.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-time-hires/perl-time-hires.hash b/package/perl-time-hires/perl-time-hires.hash
index 210f6302d..f3ab700ea 100644
--- a/package/perl-time-hires/perl-time-hires.hash
+++ b/package/perl-time-hires/perl-time-hires.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    728dc2c2715313a056792191d7d0726c Time-HiRes-1.9746.tar.gz
-sha256 89408c81bb827bc908c98eec50071e6e1158f38fa462865ecc3dc03aebf5f596 Time-HiRes-1.9746.tar.gz
+md5    b98099e0cb7702210606776e9746e103 Time-HiRes-1.9753.tar.gz
+sha256 0fbfd5f99cdd26011d5c0bc3a8e369dacc4a9e1d1658f4663ac6018f2cec4915 Time-HiRes-1.9753.tar.gz
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index 7f52625fe..c8dde49f2 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TIME_HIRES_VERSION = 1.9746
+PERL_TIME_HIRES_VERSION = 1.9753
 PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
 PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JH/JHI
 PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
-- 
2.11.0
