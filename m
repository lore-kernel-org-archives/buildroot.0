From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:27:11 +0200
Subject: [Buildroot] [git commit] package/perl-file-slurp: bump to version
 9999.28
Message-ID: <20190917202405.CDB408E9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65780730137d11c6f8923af6aa4eaaa0411ace00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-slurp/perl-file-slurp.hash | 6 +++---
 package/perl-file-slurp/perl-file-slurp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 922f08564b..4e065b850c 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bc0b52b58c369b167f12e5f6abb0cf42 File-Slurp-9999.26.tar.gz
-sha256 1e278d25df46310a8d2cd0aca9b8c2703f1eae838a99a8cb91e96950e88e0930 File-Slurp-9999.26.tar.gz
+md5    659d52a0169aea7d3728ebab3e198ef5 File-Slurp-9999.28.tar.gz
+sha256 0587ce010bcb79db9e744f14b5498be97bf2c7f2474d971916d92f0a10827cee File-Slurp-9999.28.tar.gz
 
 # computed by scancpan
-sha256 87744d1995d9a41ef32478c98f08167a13a1e09d96c3bb00ade315e3290facef README.md
+sha256 2281c2e5a690ac7f227fd9934b3d0b9abc419fd514f001d421f2f854203d92b4 README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 5ec770a3ef..7446d4e10a 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.26
+PERL_FILE_SLURP_VERSION = 9999.28
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
