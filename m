From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 22:46:42 +0200
Subject: [Buildroot] [git commit] package/perl-date-manip: bump to version
 6.85
Message-ID: <20210424202051.D6CA083992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db25a336ccd57c1a1ac8a40930eb816c2ec740e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 90961c74f5..d40aa087b5 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  92be58690a9a64d51fb158198220fd63  Date-Manip-6.83.tar.gz
-sha256  f491b2e1d876c222a59563b1bbd893c1034207ed0337304bf396311d9e9199fa  Date-Manip-6.83.tar.gz
+md5  ce3447409d83d16e6dd7bea0a18f24b4  Date-Manip-6.85.tar.gz
+sha256  1662393943b7c588478ea9d975200d825f500d26fe9996f2bf7f829cfaa5ccdc  Date-Manip-6.85.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index ab51346916..4ee81d340f 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.83
+PERL_DATE_MANIP_VERSION = 6.85
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
