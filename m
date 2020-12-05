From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:57 +0100
Subject: [Buildroot] [PATCH 10/10] package/perl-type-tiny: bump to version
 1.012000
In-Reply-To: <20201205064457.606737-1-francois.perrad@gadz.org>
References: <20201205064457.606737-1-francois.perrad@gadz.org>
Message-ID: <20201205064457.606737-10-francois.perrad@gadz.org>
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
index 85e312c6f..0c14b7d0c 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  b56b6d578843f509100f49b6ffddc21e  Type-Tiny-1.010006.tar.gz
-sha256  f1568e3f0bf103e65faadc1804c6184fe29bf52559e7ff3c12f4dad437befd82  Type-Tiny-1.010006.tar.gz
+md5  6b7976fe3a6687a3ffdd5ab2b3b11931  Type-Tiny-1.012000.tar.gz
+sha256  d3db1220161c2aea6b0b8a2225c4fef526e8dbbe56b4bffe9daabc03e2efea90  Type-Tiny-1.012000.tar.gz
 
 # computed by scancpan
 sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 3fa119a8c..dbaeebd8b 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.010006
+PERL_TYPE_TINY_VERSION = 1.012000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
