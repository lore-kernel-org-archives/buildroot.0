From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:19 +0200
Subject: [Buildroot] [PATCH 01/10] package/perl-file-slurp: bump to version
 9999.32
Message-ID: <20200724162128.2752535-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-slurp/perl-file-slurp.hash | 6 +++---
 package/perl-file-slurp/perl-file-slurp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 5bf2713dc..f3cc579f8 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a806ca5c769d811b0f32c6a773295408 File-Slurp-9999.30.tar.gz
-sha256 2a37163db0b9454e48eb308dac1fc27571be086e0864c9083bed88d9c4e93747 File-Slurp-9999.30.tar.gz
+md5  a10ddfcbe153fc8d0076936ee83b98ed  File-Slurp-9999.32.tar.gz
+sha256  4c3c21992a9d42be3a79dd74a3c83d27d38057269d65509a2f555ea0fb2bc5b0  File-Slurp-9999.32.tar.gz
 
 # computed by scancpan
-sha256 2281c2e5a690ac7f227fd9934b3d0b9abc419fd514f001d421f2f854203d92b4 README.md
+sha256  d1be945657536c93caf481b9f3c73fd1952ef66388c664e29021ab91d4fe47e8  README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 4174df4a2..0d4ab9403 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.30
+PERL_FILE_SLURP_VERSION = 9999.32
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
-- 
2.25.1
