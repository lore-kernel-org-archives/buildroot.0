From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:18:01 +0100
Subject: [Buildroot] [git commit] package/perl-file-slurp: bump to version
 9999.29
Message-ID: <20191205221012.8BE5F813E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a5719560748c788fe7e17aa34058702df6c72a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-slurp/perl-file-slurp.hash | 4 ++--
 package/perl-file-slurp/perl-file-slurp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 4e065b850c..5fc123851f 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    659d52a0169aea7d3728ebab3e198ef5 File-Slurp-9999.28.tar.gz
-sha256 0587ce010bcb79db9e744f14b5498be97bf2c7f2474d971916d92f0a10827cee File-Slurp-9999.28.tar.gz
+md5    603483824746ab4b1958bf7cf956c57a File-Slurp-9999.29.tar.gz
+sha256 0e6e47e0bba639e37e51fdc7a43b187cd90ac642e4baa13a7185bc6c223e19c7 File-Slurp-9999.29.tar.gz
 
 # computed by scancpan
 sha256 2281c2e5a690ac7f227fd9934b3d0b9abc419fd514f001d421f2f854203d92b4 README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 7446d4e10a..c1a64a7b24 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.28
+PERL_FILE_SLURP_VERSION = 9999.29
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
