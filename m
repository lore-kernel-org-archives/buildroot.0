From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  5 Jun 2020 20:04:23 +0200
Subject: [Buildroot] [PATCH 10/10] package/perl-type-tiny: bump to version
 1.010002
In-Reply-To: <20200605180423.1991841-1-francois.perrad@gadz.org>
References: <20200605180423.1991841-1-francois.perrad@gadz.org>
Message-ID: <20200605180423.1991841-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 20974d2f0..e9d84b4f9 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9d2d5ab2c5d6d2f98138ab14c5f529e3  Type-Tiny-1.010001.tar.gz
-sha256  f378663f62aaa7cf87f47b90f0951356d26a08468027da26962387998a6b1aae  Type-Tiny-1.010001.tar.gz
+md5  e6f95814ebff168f747775e7bf320342  Type-Tiny-1.010002.tar.gz
+sha256  2ea6ea2d8b2b3bb1b94f0309fa5064d57e7734c8bb14e99218e655dc1647073a  Type-Tiny-1.010002.tar.gz
 
 # computed by scancpan
-sha256  8c466d4e49afea63822407988a7b7c77be0178bc398fe088fadffb5202c44a4a  COPYRIGHT
+sha256  f46e9e2cf16c0d7dd0939066cb0764e87b34c5f29cc3ab715ad363161c71a66a  COPYRIGHT
 sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 9c89eb5da..119d6a81b 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.010001
+PERL_TYPE_TINY_VERSION = 1.010002
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
