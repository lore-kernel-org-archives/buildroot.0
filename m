From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:26:14 +0200
Subject: [Buildroot] [git commit] package/perl-file-listing: bump to version
 6.11
Message-ID: <20201024201639.7E9DE839B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f03ad101fe2dc56577da60a2dd7d0e631469e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

now, LICENSE has its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-listing/perl-file-listing.hash | 6 +++---
 package/perl-file-listing/perl-file-listing.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index 6189948a19..5496646d29 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    83f636b477741f3a014585bb9cc079a6 File-Listing-6.04.tar.gz
-sha256 1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5 File-Listing-6.04.tar.gz
+md5  6f298b96fdc072fbd0e0c2890a70ab2e  File-Listing-6.11.tar.gz
+sha256  c24c14ece10b949e1cb52d64bc28b42cbaebf87e00293a3f7500950d6be0bf6e  File-Listing-6.11.tar.gz
 
 # computed by scancpan
-sha256 9ee526d1593c48e65141aea5567f0cdf156eb57e68448cd91584c7aae92bd787 README
+sha256  7f0ccec295e6d7d2be1439cedd7caf6cc6247191f4c10ac56d91ee9bc265ba02  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index 9f3ca95164..f8d449ba36 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.04
+PERL_FILE_LISTING_VERSION = 6.11
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
-PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
-PERL_FILE_LISTING_LICENSE_FILES = README
+PERL_FILE_LISTING_LICENSE_FILES = LICENSE
 PERL_FILE_LISTING_DISTNAME = File-Listing
 
 $(eval $(perl-package))
