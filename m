From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:37:21 +0200
Subject: [Buildroot] [git commit] package/perl-timedate: bump to version 2.33
Message-ID: <20200605203650.E004783AC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a9492d52609ddaae50af00328cae7de02d00a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-timedate/perl-timedate.hash | 6 +++---
 package/perl-timedate/perl-timedate.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 2cd05855f8..5ea4d49cb8 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    87dfc984aada1c015233518432cb5951 TimeDate-2.32.tar.gz
-sha256 34eca099e375e2d142ea6cc935922c4980dc21c65ce7c24823ca08457c4bb3d6 TimeDate-2.32.tar.gz
+md5  5e5afe22c8d417417283d1f7f4572a57  TimeDate-2.33.tar.gz
+sha256  c0b69c4b039de6f501b0d9f13ec58c86b040c1f7e9b27ef249651c143d605eb2  TimeDate-2.33.tar.gz
 
 # computed by scancpan
-sha256 e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9 README
+sha256  e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9  README
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index f6c910bbd0..89a82c042b 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TIMEDATE_VERSION = 2.32
+PERL_TIMEDATE_VERSION = 2.33
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
