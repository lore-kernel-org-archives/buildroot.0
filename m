From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Oct 2020 22:07:24 +0200
Subject: [Buildroot] [PATCH 10/11] package/perl-type-tiny: bump to version
 1.010006
In-Reply-To: <20201023200725.1407498-1-francois.perrad@gadz.org>
References: <20201023200725.1407498-1-francois.perrad@gadz.org>
Message-ID: <20201023200725.1407498-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-type-tiny/perl-type-tiny.hash | 4 ++--
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index c4c64a62b..85e312c6f 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d20a07df0704e92c9c9beb72c5fdf153  Type-Tiny-1.010005.tar.gz
-sha256  e01becf614849ff8a869614c46ac2706b18da8e35ed80277d8475d8c88ca9173  Type-Tiny-1.010005.tar.gz
+md5  b56b6d578843f509100f49b6ffddc21e  Type-Tiny-1.010006.tar.gz
+sha256  f1568e3f0bf103e65faadc1804c6184fe29bf52559e7ff3c12f4dad437befd82  Type-Tiny-1.010006.tar.gz
 
 # computed by scancpan
 sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 5d9758269..3fa119a8c 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.010005
+PERL_TYPE_TINY_VERSION = 1.010006
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
