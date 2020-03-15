From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:11:09 +0100
Subject: [Buildroot] [git commit] package/perl-timedate: bump to version 2.32
Message-ID: <20200315150142.065E583E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17a75bbccfd9a4e7810cbb2fe4182b4f9276cc45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-timedate/perl-timedate.hash | 4 ++--
 package/perl-timedate/perl-timedate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 5ddfbd2518..2cd05855f8 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    230d361a13eae79dfe3fb650acece511 TimeDate-2.31.tar.gz
-sha256 5c720fedb245122d073ea9c030aca24b06a615c71d40c46f832a8a1809354d81 TimeDate-2.31.tar.gz
+md5    87dfc984aada1c015233518432cb5951 TimeDate-2.32.tar.gz
+sha256 34eca099e375e2d142ea6cc935922c4980dc21c65ce7c24823ca08457c4bb3d6 TimeDate-2.32.tar.gz
 
 # computed by scancpan
 sha256 e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9 README
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index d4b6305abf..f6c910bbd0 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TIMEDATE_VERSION = 2.31
+PERL_TIMEDATE_VERSION = 2.32
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
