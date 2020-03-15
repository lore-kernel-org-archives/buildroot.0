From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:11:05 +0100
Subject: [Buildroot] [git commit] package/perl-sys-mmap: bump to version 0.20
Message-ID: <20200315150141.EC99683E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8df50233e92f27a4b65c4bb7b9e68c2d5e46d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sys-mmap/perl-sys-mmap.hash | 4 ++--
 package/perl-sys-mmap/perl-sys-mmap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-sys-mmap/perl-sys-mmap.hash b/package/perl-sys-mmap/perl-sys-mmap.hash
index d50fb717d1..ce4d673540 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.hash
+++ b/package/perl-sys-mmap/perl-sys-mmap.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    990c9106a88dc843035f7bcb109e6c0e Sys-Mmap-0.19.tar.gz
-sha256 09295e25cc9b0599d9009d19b2be89fcecaecc62ce594f873d7f70d7c10900fa Sys-Mmap-0.19.tar.gz
+md5    57172ce9b33c04de460b4e7ad68d2e9c Sys-Mmap-0.20.tar.gz
+sha256 1820ce2c89f1ab7357644f8db0f49f142f54526250fb1e235db10aa80f15e2cf Sys-Mmap-0.20.tar.gz
 
 # computed by scancpan
 sha256 4ac2afe465736476a06e52edcc78c72cfa0fa4d625916e58ab4f2af6c598709c Artistic
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index 489d4dd7ee..5e0814526a 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_SYS_MMAP_VERSION = 0.19
+PERL_SYS_MMAP_VERSION = 0.20
 PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
-PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
+PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_MMAP_LICENSE_FILES = Artistic Copying
 PERL_SYS_MMAP_DISTNAME = Sys-Mmap
