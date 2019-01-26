From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 26 Jan 2019 09:04:39 +0100
Subject: [Buildroot] [PATCH 6/8] perl-package-stash: bump to version 0.38
In-Reply-To: <20190126080441.10769-1-francois.perrad@gadz.org>
References: <20190126080441.10769-1-francois.perrad@gadz.org>
Message-ID: <20190126080441.10769-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-package-stash/perl-package-stash.hash | 6 +++---
 package/perl-package-stash/perl-package-stash.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 4d9b20287..be8760d2d 100644
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
index 26e8eb325..b1a83bd95 100644
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
-- 
2.17.1
