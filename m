From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:33:08 +0200
Subject: [Buildroot] [git commit] package/perl-role-tiny: bump to version
 2.000008
Message-ID: <20190917202949.C7B9D8E9EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed1e005588f71987e6900955eb41fb9f567f00c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project now ships a proper LICENSE file, with the complete license
text, so we use it instead of the README file. The license remains the
same as Perl, i.e Artistic license or GPL-1.0+.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-role-tiny/Config.in           | 2 +-
 package/perl-role-tiny/perl-role-tiny.hash | 6 +++---
 package/perl-role-tiny/perl-role-tiny.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-role-tiny/Config.in b/package/perl-role-tiny/Config.in
index ebbe720203..0c44d9907f 100644
--- a/package/perl-role-tiny/Config.in
+++ b/package/perl-role-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_ROLE_TINY
 	bool "perl-role-tiny"
 	help
-	  Roles. Like a nouvelle cuisine portion size slice of Moose.
+	  Roles: a nouvelle cuisine portion size slice of Moose.
 
 	  https://metacpan.org/release/Role-Tiny
diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index 33601bb6b2..fa28028fcc 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7c277728a7e090f64b495857cadfed08 Role-Tiny-2.000006.tar.gz
-sha256 cc73418c904a0286ecd8915eac11f5be2a8d1e17ea9cb54c9116b0340cd3e382 Role-Tiny-2.000006.tar.gz
+md5    b1c5019b300d8acf7d6ddb7f312814fd Role-Tiny-2.000008.tar.gz
+sha256 b1541fc5e3e0eb2dbd55b25c432293c197e0153c2c9f7747deba4df72c27146a Role-Tiny-2.000008.tar.gz
 
 # computed by scancpan
-sha256 08292f0e1797371bce0a1b5bd80e0657b3aabf9c0ecc2ce87ad7a448a7adacce README
+sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 6501972f22..f18fd0bed8 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.000006
+PERL_ROLE_TINY_VERSION = 2.000008
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
-PERL_ROLE_TINY_LICENSE_FILES = README
+PERL_ROLE_TINY_LICENSE_FILES = LICENSE
 PERL_ROLE_TINY_DISTNAME = Role-Tiny
 
 $(eval $(perl-package))
