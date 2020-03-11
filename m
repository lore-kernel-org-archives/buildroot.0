From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:49 +0100
Subject: [Buildroot] [PATCH 03/10] package/perl-file-slurp: bump to version
 9999.30
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-file-slurp/perl-file-slurp.hash | 4 ++--
 package/perl-file-slurp/perl-file-slurp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 5fc123851..5bf2713dc 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    603483824746ab4b1958bf7cf956c57a File-Slurp-9999.29.tar.gz
-sha256 0e6e47e0bba639e37e51fdc7a43b187cd90ac642e4baa13a7185bc6c223e19c7 File-Slurp-9999.29.tar.gz
+md5    a806ca5c769d811b0f32c6a773295408 File-Slurp-9999.30.tar.gz
+sha256 2a37163db0b9454e48eb308dac1fc27571be086e0864c9083bed88d9c4e93747 File-Slurp-9999.30.tar.gz
 
 # computed by scancpan
 sha256 2281c2e5a690ac7f227fd9934b3d0b9abc419fd514f001d421f2f854203d92b4 README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index c1a64a7b2..4174df4a2 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.29
+PERL_FILE_SLURP_VERSION = 9999.30
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
