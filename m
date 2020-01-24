From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 20:14:38 +0100
Subject: [Buildroot] [git commit] package/perl-timedate: bump to version 2.31
Message-ID: <20200124190621.8F39883968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d645e5dc082377bc28f2f4e28c406e9f949cfab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-timedate/perl-timedate.hash | 4 ++--
 package/perl-timedate/perl-timedate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 234136d0c8..5ddfbd2518 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b1d91153ac971347aee84292ed886c1c TimeDate-2.30.tar.gz
-sha256 75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86 TimeDate-2.30.tar.gz
+md5    230d361a13eae79dfe3fb650acece511 TimeDate-2.31.tar.gz
+sha256 5c720fedb245122d073ea9c030aca24b06a615c71d40c46f832a8a1809354d81 TimeDate-2.31.tar.gz
 
 # computed by scancpan
 sha256 e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9 README
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index bc4fc9a11f..d4b6305abf 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_TIMEDATE_VERSION = 2.30
+PERL_TIMEDATE_VERSION = 2.31
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
-PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
+PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
 PERL_TIMEDATE_LICENSE_FILES = README
 PERL_TIMEDATE_DISTNAME = TimeDate
