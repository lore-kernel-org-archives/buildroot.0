From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:56 +0100
Subject: [Buildroot] [PATCH 10/10] package/perl-timedate: bump to version
 2.32
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-timedate/perl-timedate.hash | 4 ++--
 package/perl-timedate/perl-timedate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 5ddfbd251..2cd05855f 100644
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
index d4b6305ab..f6c910bbd 100644
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
-- 
2.20.1
