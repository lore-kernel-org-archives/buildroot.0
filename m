From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:49 +0100
Subject: [Buildroot] [PATCH 02/10] package/perl-file-listing: bump to
 version 6.14
In-Reply-To: <20201205064457.606737-1-francois.perrad@gadz.org>
References: <20201205064457.606737-1-francois.perrad@gadz.org>
Message-ID: <20201205064457.606737-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-listing/perl-file-listing.hash | 4 ++--
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index 5496646d2..235896571 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  6f298b96fdc072fbd0e0c2890a70ab2e  File-Listing-6.11.tar.gz
-sha256  c24c14ece10b949e1cb52d64bc28b42cbaebf87e00293a3f7500950d6be0bf6e  File-Listing-6.11.tar.gz
+md5  cf60a79563185391831613178a79b4cd  File-Listing-6.14.tar.gz
+sha256  15b3a4871e23164a36f226381b74d450af41f12cc94985f592a669fcac7b48ff  File-Listing-6.14.tar.gz
 
 # computed by scancpan
 sha256  7f0ccec295e6d7d2be1439cedd7caf6cc6247191f4c10ac56d91ee9bc265ba02  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index f8d449ba3..61bbc18eb 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.11
+PERL_FILE_LISTING_VERSION = 6.14
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
