From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:40 +0200
Subject: [Buildroot] [PATCH 05/14] package/perl-file-slurp: bump to version
 9999.26
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-5-francois.perrad@gadz.org>
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
index 4ed670ec7..922f08564 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    52afbe79bbf2b86c11ac4986030a9275 File-Slurp-9999.25.tar.gz
-sha256 c7ea97bae61bc68404476ce69277f6f796d31ab58c9c40ee390d9d5a1c5ce3c1 File-Slurp-9999.25.tar.gz
+md5    bc0b52b58c369b167f12e5f6abb0cf42 File-Slurp-9999.26.tar.gz
+sha256 1e278d25df46310a8d2cd0aca9b8c2703f1eae838a99a8cb91e96950e88e0930 File-Slurp-9999.26.tar.gz
 
 # computed by scancpan
 sha256 87744d1995d9a41ef32478c98f08167a13a1e09d96c3bb00ade315e3290facef README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 4ceba25f5..5ec770a3e 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.25
+PERL_FILE_SLURP_VERSION = 9999.26
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
