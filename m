From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:39:01 +0100
Subject: [Buildroot] [git commit] package/perl-moo: bump to version 2.004004
Message-ID: <20201205132743.9484482BAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dc77fc3241c4f9e7e325cf3e2a1c423fde8bb1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-moo/Config.in     | 1 -
 package/perl-moo/perl-moo.hash | 4 ++--
 package/perl-moo/perl-moo.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/perl-moo/Config.in b/package/perl-moo/Config.in
index e4a6db290b..9b2b4a8ca1 100644
--- a/package/perl-moo/Config.in
+++ b/package/perl-moo/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PERL_MOO
 	bool "perl-moo"
 	select BR2_PACKAGE_PERL_CLASS_METHOD_MODIFIERS # runtime
-	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
 	select BR2_PACKAGE_PERL_ROLE_TINY # runtime
 	select BR2_PACKAGE_PERL_SUB_QUOTE # runtime
 	help
diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 00e8117ad9..af0dd2e926 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  e542104553d616b15631b5c66ccee904  Moo-2.004000.tar.gz
-sha256  323240d000394cf38ec42e865b05cb8928f625c82c9391cd2cdc72b33c51b834  Moo-2.004000.tar.gz
+md5  51f3732e043a1e856ab6cdc260d2814c  Moo-2.004004.tar.gz
+sha256  714b77b115788708c6d8ab6f18eea173f8109d397aecd34e32cc71a0ffcf2246  Moo-2.004004.tar.gz
 
 # computed by scancpan
 sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index fce88f6add..77c6c1e356 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.004000
+PERL_MOO_VERSION = 2.004004
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
