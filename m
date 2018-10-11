From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:56:02 +0200
Subject: [Buildroot] [git commit] perl-class-std-fast: add missing
 dependency on host-perl-module-build
Message-ID: <20181011185612.B761882DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=028a6d64de59319aa79f1a411de6dbfd4eea9890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/6ca5d163cbf98dff7569aeecdd8a5b5095a2ccd5/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-class-std-fast/perl-class-std-fast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index ba0feaf72a..5986359cff 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_STD_FAST_VERSION = v0.0.8
 PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
+PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_FAST_LICENSE_FILES = README
 
