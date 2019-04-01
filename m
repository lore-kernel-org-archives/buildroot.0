From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:56:40 +0200
Subject: [Buildroot] [git commit] package/perl-dbi: bump to version 1.642
Message-ID: <20190401200604.57ADF8B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db65edfa3766eba2798fe248ea40686e757f2f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-dbi/perl-dbi.hash | 4 ++--
 package/perl-dbi/perl-dbi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-dbi/perl-dbi.hash b/package/perl-dbi/perl-dbi.hash
index 1d0b7e9ad5..100d07038f 100644
--- a/package/perl-dbi/perl-dbi.hash
+++ b/package/perl-dbi/perl-dbi.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e77fd37fcf77fc88fde029c1b75ded54 DBI-1.641.tar.gz
-sha256 5509e532cdd0e3d91eda550578deaac29e2f008a12b64576e8c261bb92e8c2c1 DBI-1.641.tar.gz
+md5    f2ba18b5cea1c8cb322a62be0a847f3d DBI-1.642.tar.gz
+sha256 3f2025023a56286cebd15cb495e36ccd9b456c3cc229bf2ce1f69e9ebfc27f5d DBI-1.642.tar.gz
 
 # computed by scancpan
 sha256 33453c8b0d8d474a42669ac702a13c20f39c91a34b3df4e6ca778fc2f0f711c7 LICENSE
diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
index 835e8bdfe3..3b824d7489 100644
--- a/package/perl-dbi/perl-dbi.mk
+++ b/package/perl-dbi/perl-dbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DBI_VERSION = 1.641
+PERL_DBI_VERSION = 1.642
 PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
 PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
 PERL_DBI_LICENSE = Artistic or GPL-1.0+
