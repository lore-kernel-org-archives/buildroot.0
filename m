From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 11 Oct 2018 18:28:09 +0200
Subject: [Buildroot] [PATCH] perl-class-std-fast: add missing host dependency
Message-ID: <20181011162809.14049-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/6ca5d163cbf98dff7569aeecdd8a5b5095a2ccd5/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-class-std-fast/perl-class-std-fast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 06f154815..57e57b195 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_STD_FAST_VERSION = v0.0.8
 PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
+PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_FAST_LICENSE_FILES = README
 PERL_CLASS_STD_FAST_DISTNAME = Class-Std-Fast
-- 
2.17.1
