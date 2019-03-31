From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:38 +0200
Subject: [Buildroot] [PATCH 03/14] package/perl-date-manip: bump to version
 6.76
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-3-francois.perrad@gadz.org>
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
index b290e8ea2..ca4263fd4 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d922d5fe4a00521dc171ac3ee65a9d61 Date-Manip-6.75.tar.gz
-sha256 c1fbcfbe2ab1a84e57f191807e87c97985da00926f64d1aae598c8756acbb67d Date-Manip-6.75.tar.gz
+md5    a539820a8725e79c67826158a6b940a1 Date-Manip-6.76.tar.gz
+sha256 1c87c78c03e3479e3b695952c0a5c11d3593ca9a5340dfb14d0be3d3e7ad63a8 Date-Manip-6.76.tar.gz
 
 # computed by scancpan
 sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index cc668184e..cc999b828 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.75
+PERL_DATE_MANIP_VERSION = 6.76
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
