From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:38:56 +0100
Subject: [Buildroot] [git commit] package/perl-file-listing: bump to version
 6.14
Message-ID: <20201205132743.642B58156C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce3463db6c1491921f351147cecf599aa6923304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-listing/perl-file-listing.hash | 4 ++--
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index 5496646d29..2358965714 100644
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
index f8d449ba36..61bbc18eb8 100644
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
