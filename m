From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:18 +0200
Subject: [Buildroot] [PATCH 03/15] perl-file-listing: fix dependencies
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-listing/perl-file-listing.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index a9d8ced..c376c61 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -7,7 +7,7 @@
 PERL_FILE_LISTING_VERSION = 6.04
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
+PERL_FILE_LISTING_DEPENDENCIES = perl perl-http-date
 PERL_FILE_LISTING_LICENSE = Artistic or GPLv1+
 PERL_FILE_LISTING_LICENSE_FILES = README
 
-- 
2.1.4
