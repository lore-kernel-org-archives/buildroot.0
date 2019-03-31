From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:36 +0200
Subject: [Buildroot] [PATCH 01/14] package/perl-class-inspector: bump to
 version 1.34
Message-ID: <20190331174449.1461-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-class-inspector/perl-class-inspector.hash | 6 +++---
 package/perl-class-inspector/perl-class-inspector.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-class-inspector/perl-class-inspector.hash b/package/perl-class-inspector/perl-class-inspector.hash
index 181c09ace..fcbefdcbf 100644
--- a/package/perl-class-inspector/perl-class-inspector.hash
+++ b/package/perl-class-inspector/perl-class-inspector.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    db471d6ecf47fa054726553319b7c34f Class-Inspector-1.32.tar.gz
-sha256 cefadc8b5338e43e570bc43f583e7c98d535c17b196bcf9084bb41d561cc0535 Class-Inspector-1.32.tar.gz
+md5    657ec026aae1b28ee9368849fea8be75 Class-Inspector-1.34.tar.gz
+sha256 fe9a86dcb3ccc7a99d6865e6b674a14d20164f76bd84f2eb43aafcc6bf1cf0d8 Class-Inspector-1.34.tar.gz
 
 # computed by scancpan
-sha256 3ed0185f73a0570b72a2dc95c6bde500dc800c6f778ccbd688df4f88e6e65232 LICENSE
+sha256 401fe9c98bdb5707df71447fb93141f8cb2d85337d45505f5ae50a776a3f6666 LICENSE
diff --git a/package/perl-class-inspector/perl-class-inspector.mk b/package/perl-class-inspector/perl-class-inspector.mk
index c265194f1..52e2032b5 100644
--- a/package/perl-class-inspector/perl-class-inspector.mk
+++ b/package/perl-class-inspector/perl-class-inspector.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_INSPECTOR_VERSION = 1.32
+PERL_CLASS_INSPECTOR_VERSION = 1.34
 PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).tar.gz
 PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
