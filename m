From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Sep 2019 20:16:19 +0200
Subject: [Buildroot] [PATCH 2/7] package/perl-date-manip: bump to version
 6.78
In-Reply-To: <20190917181624.29378-1-francois.perrad@gadz.org>
References: <20190917181624.29378-1-francois.perrad@gadz.org>
Message-ID: <20190917181624.29378-2-francois.perrad@gadz.org>
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
index 22dd22ac9..fbf3b5490 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e5f64608aace863ac84b7e69c8248ca6 Date-Manip-6.77.tar.gz
-sha256 51c32b8207ced610d61fadbb876cdb8a116ae27dddcf6fa5017512215833836b Date-Manip-6.77.tar.gz
+md5    3668485fe389e12e7376974290976eb4 Date-Manip-6.78.tar.gz
+sha256 cb36084401f9e89999c7046811c83ac58ea44fc12827bf61ca1167a79e915db9 Date-Manip-6.78.tar.gz
 
 # computed by scancpan
 sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 1e7c632f2..8154cd7a6 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.77
+PERL_DATE_MANIP_VERSION = 6.78
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
