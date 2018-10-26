From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:20:15 +0200
Subject: [Buildroot] [git commit] perl-file-slurp: bump to version 9999.23
Message-ID: <20181026191919.D69338908F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b58bcf1ce3019f7be8c26e6521c1a2aef943d677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file is changed to README.md, because README no longer
exists. The licensing terms are unchanged:

"""
This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
"""

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-slurp/perl-file-slurp.hash | 6 +++---
 package/perl-file-slurp/perl-file-slurp.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
index 18f9e65ced..617973191d 100644
--- a/package/perl-file-slurp/perl-file-slurp.hash
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7d584cd15c4f8b9547765eff8c4ef078 File-Slurp-9999.19.tar.gz
-sha256 ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643 File-Slurp-9999.19.tar.gz
+md5    5c08acb15544113657994960f16c8910 File-Slurp-9999.23.tar.gz
+sha256 9eb73287890e172c4e39ce069f0e6a82da90df20dc7e2d52c666e9b07489a7f7 File-Slurp-9999.23.tar.gz
 
 # computed by scancpan
-sha256 17e638d011c04b1d39b300c07ccd0c57d7857b9ccdb9fe7abce1b15f0e7b0c20 README
+sha256 21eec4bf12d10c78042734c76873852aaffce278ad4fd90814d91b8c885e6ef3 README.md
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 64d5cde7a8..fd80d4f6d5 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_FILE_SLURP_VERSION = 9999.19
+PERL_FILE_SLURP_VERSION = 9999.23
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
-PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/U/UR/URI
+PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
-PERL_FILE_SLURP_LICENSE_FILES = README
+PERL_FILE_SLURP_LICENSE_FILES = README.md
 PERL_FILE_SLURP_DISTNAME = File-Slurp
 
 $(eval $(perl-package))
