From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 26 Jan 2019 09:04:34 +0100
Subject: [Buildroot] [PATCH 1/8] perl-date-manip: bump to version 6.75
Message-ID: <20190126080441.10769-1-francois.perrad@gadz.org>
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
index 6fb8a1896..b290e8ea2 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    0f85b1d9236e22a53dcb1c7f4b4fed77 Date-Manip-6.73.tar.gz
-sha256 d39295c7c3f19b43470d1203dded8cb649b41a1098e51b5b7c7cf17b662ca255 Date-Manip-6.73.tar.gz
+md5    d922d5fe4a00521dc171ac3ee65a9d61 Date-Manip-6.75.tar.gz
+sha256 c1fbcfbe2ab1a84e57f191807e87c97985da00926f64d1aae598c8756acbb67d Date-Manip-6.75.tar.gz
 
 # computed by scancpan
 sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 5e34ba4da..cc668184e 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.73
+PERL_DATE_MANIP_VERSION = 6.75
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
