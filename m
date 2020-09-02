From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:38 +0200
Subject: [Buildroot] [PATCH 7/7] package/perl-type-tiny: bump to version
 1.010005
In-Reply-To: <20200902150838.874797-1-francois.perrad@gadz.org>
References: <20200902150838.874797-1-francois.perrad@gadz.org>
Message-ID: <20200902150838.874797-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 5 ++---
 package/perl-type-tiny/perl-type-tiny.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 20974d2f0..c4c64a62b 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,7 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9d2d5ab2c5d6d2f98138ab14c5f529e3  Type-Tiny-1.010001.tar.gz
-sha256  f378663f62aaa7cf87f47b90f0951356d26a08468027da26962387998a6b1aae  Type-Tiny-1.010001.tar.gz
+md5  d20a07df0704e92c9c9beb72c5fdf153  Type-Tiny-1.010005.tar.gz
+sha256  e01becf614849ff8a869614c46ac2706b18da8e35ed80277d8475d8c88ca9173  Type-Tiny-1.010005.tar.gz
 
 # computed by scancpan
-sha256  8c466d4e49afea63822407988a7b7c77be0178bc398fe088fadffb5202c44a4a  COPYRIGHT
 sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 9c89eb5da..5d9758269 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.010001
+PERL_TYPE_TINY_VERSION = 1.010005
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-PERL_TYPE_TINY_LICENSE_FILES = COPYRIGHT LICENSE
+PERL_TYPE_TINY_LICENSE_FILES = LICENSE
 PERL_TYPE_TINY_DISTNAME = Type-Tiny
 
 $(eval $(perl-package))
-- 
2.25.1
