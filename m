From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:22:25 +0100
Subject: [Buildroot] [git commit] perl-file-slurp: bump to version 9999.25
Message-ID: <20190127102332.5CABE8E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1662c215b8e7eea0b8bd082bdca6d414f6cd89c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-file-slurp/perl-file-slurp.hash | 6 +++---
 package/perl-file-slurp/perl-file-slurp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 617973191d..4ed670ec7c 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5c08acb15544113657994960f16c8910 File-Slurp-9999.23.tar.gz
-sha256 9eb73287890e172c4e39ce069f0e6a82da90df20dc7e2d52c666e9b07489a7f7 File-Slurp-9999.23.tar.gz
+md5    52afbe79bbf2b86c11ac4986030a9275 File-Slurp-9999.25.tar.gz
+sha256 c7ea97bae61bc68404476ce69277f6f796d31ab58c9c40ee390d9d5a1c5ce3c1 File-Slurp-9999.25.tar.gz
 
 # computed by scancpan
-sha256 21eec4bf12d10c78042734c76873852aaffce278ad4fd90814d91b8c885e6ef3 README.md
+sha256 87744d1995d9a41ef32478c98f08167a13a1e09d96c3bb00ade315e3290facef README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index fd80d4f6d5..4ceba25f51 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.23
+PERL_FILE_SLURP_VERSION = 9999.25
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
