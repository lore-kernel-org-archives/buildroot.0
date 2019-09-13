From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:38:01 +0200
Subject: [Buildroot] [git commit] package/perl-class-std-fast: fixup the 'v'
 prefix in the version
Message-ID: <20190913203408.012978E1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0ada56a2acd1eae7b7684de6cca12b0c204442f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the perl-class-std-fast version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
PERL_CLASS_STD_FAST_SOURCE and not PERL_CLASS_STD_FAST_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-class-std-fast/perl-class-std-fast.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 57e57b1954..b5d32398a5 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERL_CLASS_STD_FAST_VERSION = v0.0.8
-PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
+PERL_CLASS_STD_FAST_VERSION = 0.0.8
+PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-v$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
 PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
