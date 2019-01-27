From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:22:54 +0100
Subject: [Buildroot] [git commit] perl-package-stash: bump to version 0.38
Message-ID: <20190127102332.779D58E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b915946af03e3590d325a0a5f6c6012d8de5d632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-package-stash/perl-package-stash.hash | 6 +++---
 package/perl-package-stash/perl-package-stash.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 4d9b202879..be8760d2d9 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7e47a8261312e1cf3d12bd2007916b66 Package-Stash-0.37.tar.gz
-sha256 06ab05388f9130cd377c0e1d3e3bafeed6ef6a1e22104571a9e1d7bfac787b2c Package-Stash-0.37.tar.gz
+md5    dc2d802eea2cb0b52ed9c4dd178761dd Package-Stash-0.38.tar.gz
+sha256 c58ee8844df2dda38e3bf66fdf443439aaefaef1a33940edf2055f0afd223a7f Package-Stash-0.38.tar.gz
 
 # computed by scancpan
-sha256 b4e0637ed96008ddcbf7e0ddeb73967df3d0b4dc62a6b7fdb86eac37018cb12e LICENSE
+sha256 13aab710649bae5a8bbb1ae725587ece773bf390537dba2da71247bd937d54b4 LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index 26e8eb3253..b1a83bd957 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.37
+PERL_PACKAGE_STASH_VERSION = 0.38
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
-PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
 PERL_PACKAGE_STASH_LICENSE_FILES = LICENSE
 PERL_PACKAGE_STASH_DISTNAME = Package-Stash
