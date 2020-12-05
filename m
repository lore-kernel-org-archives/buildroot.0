From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:48 +0100
Subject: [Buildroot] [PATCH 01/10] package/perl-date-manip: bump to version
 6.83
Message-ID: <20201205064457.606737-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 207c59208..90961c74f 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  13c7600ff8a33d585b753874df85e4ea  Date-Manip-6.82.tar.gz
-sha256  fa96bcf94c6b4b7d3333f073f5d0faad59f546e5aec13ac01718f2e6ef14672a  Date-Manip-6.82.tar.gz
+md5  92be58690a9a64d51fb158198220fd63  Date-Manip-6.83.tar.gz
+sha256  f491b2e1d876c222a59563b1bbd893c1034207ed0337304bf396311d9e9199fa  Date-Manip-6.83.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index a54a53a1f..ab5134691 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.82
+PERL_DATE_MANIP_VERSION = 6.83
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
