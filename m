From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:26:47 +0200
Subject: [Buildroot] [PATCH 02/11] perl-date-manip: bump to version 6.73
In-Reply-To: <20181026032656.9039-1-francois.perrad@gadz.org>
References: <20181026032656.9039-1-francois.perrad@gadz.org>
Message-ID: <20181026032656.9039-2-francois.perrad@gadz.org>
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
index f02f65782..6fb8a1896 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b41b0d476fd7eae3ce81324386266a85 Date-Manip-6.72.tar.gz
-sha256 38f4dd9d94b41092ca7b9da2ef72c3bb8b8c8bff6da14d785c612f3cc7a94da6 Date-Manip-6.72.tar.gz
+md5    0f85b1d9236e22a53dcb1c7f4b4fed77 Date-Manip-6.73.tar.gz
+sha256 d39295c7c3f19b43470d1203dded8cb649b41a1098e51b5b7c7cf17b662ca255 Date-Manip-6.73.tar.gz
 
 # computed by scancpan
 sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 08d85f2d4..5e34ba4da 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.72
+PERL_DATE_MANIP_VERSION = 6.73
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
