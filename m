From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:44 +0100
Subject: [Buildroot] [PATCH 2/8] package/perl-date-manip: bump to version
 6.79
In-Reply-To: <20191204083351.6134-1-francois.perrad@gadz.org>
References: <20191204083351.6134-1-francois.perrad@gadz.org>
Message-ID: <20191204083351.6134-2-francois.perrad@gadz.org>
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
index fbf3b5490..bb2e6efe7 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3668485fe389e12e7376974290976eb4 Date-Manip-6.78.tar.gz
-sha256 cb36084401f9e89999c7046811c83ac58ea44fc12827bf61ca1167a79e915db9 Date-Manip-6.78.tar.gz
+md5    a3b2c1129f02cc5ce5de59d506afab1a Date-Manip-6.79.tar.gz
+sha256 71a8c42ce4edbd46a3ca2a17a7218ceed958cd7ad0dfeb79389f23d0f466943a Date-Manip-6.79.tar.gz
 
 # computed by scancpan
 sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 8154cd7a6..d930ee8c9 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.78
+PERL_DATE_MANIP_VERSION = 6.79
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
