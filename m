From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:56:12 +0200
Subject: [Buildroot] [git commit] package/perl-class-inspector: bump to
 version 1.34
Message-ID: <20190401200604.3D0D0811C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d916b78a83a5da04f69bdf609736539147c4cb45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file changes only due to copyright year
changes:

-This software is copyright (c) 2016 by Adam Kennedy.
+This software is copyright (c) 2002-2019 by Adam Kennedy.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add details as to why the license file hash changed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-class-inspector/perl-class-inspector.hash | 6 +++---
 package/perl-class-inspector/perl-class-inspector.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-class-inspector/perl-class-inspector.hash b/package/perl-class-inspector/perl-class-inspector.hash
index 181c09acec..fcbefdcbf3 100644
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
index c265194f12..52e2032b5b 100644
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
