From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Jul 2019 21:12:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/perl-class-instpector: bump to
 version 1.36
Message-ID: <20190726191214.12883-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-class-inspector/perl-class-inspector.hash | 4 ++--
 package/perl-class-inspector/perl-class-inspector.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-class-inspector/perl-class-inspector.hash b/package/perl-class-inspector/perl-class-inspector.hash
index fcbefdcbf..ee7a95bfa 100644
--- a/package/perl-class-inspector/perl-class-inspector.hash
+++ b/package/perl-class-inspector/perl-class-inspector.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    657ec026aae1b28ee9368849fea8be75 Class-Inspector-1.34.tar.gz
-sha256 fe9a86dcb3ccc7a99d6865e6b674a14d20164f76bd84f2eb43aafcc6bf1cf0d8 Class-Inspector-1.34.tar.gz
+md5    084c3aeec023639d21ecbaf7d4460b21 Class-Inspector-1.36.tar.gz
+sha256 cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e Class-Inspector-1.36.tar.gz
 
 # computed by scancpan
 sha256 401fe9c98bdb5707df71447fb93141f8cb2d85337d45505f5ae50a776a3f6666 LICENSE
diff --git a/package/perl-class-inspector/perl-class-inspector.mk b/package/perl-class-inspector/perl-class-inspector.mk
index 52e2032b5..fdb332366 100644
--- a/package/perl-class-inspector/perl-class-inspector.mk
+++ b/package/perl-class-inspector/perl-class-inspector.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_INSPECTOR_VERSION = 1.34
+PERL_CLASS_INSPECTOR_VERSION = 1.36
 PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).tar.gz
 PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
