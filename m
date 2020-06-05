From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  5 Jun 2020 20:04:14 +0200
Subject: [Buildroot] [PATCH 01/10] package/perl-date-manip: bump to version
 6.82
Message-ID: <20200605180423.1991841-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-date-manip/perl-date-manip.hash | 6 +++---
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index a35b51456..207c59208 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a9ff96f05675ac4cb7f19c4b03a7363b Date-Manip-6.81.tar.gz
-sha256 044c319e2213dad73abd32b7f731bf4593d1e9fa96024bdc6b6475a2e768949b Date-Manip-6.81.tar.gz
+md5  13c7600ff8a33d585b753874df85e4ea  Date-Manip-6.82.tar.gz
+sha256  fa96bcf94c6b4b7d3333f073f5d0faad59f546e5aec13ac01718f2e6ef14672a  Date-Manip-6.82.tar.gz
 
 # computed by scancpan
-sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
+sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 20dc72276..a54a53a1f 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.81
+PERL_DATE_MANIP_VERSION = 6.82
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
