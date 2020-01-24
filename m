From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 20:15:00 +0100
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 1.008003
Message-ID: <20200124190621.97F1483968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=170faceeda7495053d5e2d56592307c9cc79a7cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the year of LICENSE was upgraded:
- This software is copyright (c) 2019 by Toby Inkster.
+ This software is copyright (c) 2020 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-type-tiny/Config.in           | 2 +-
 package/perl-type-tiny/perl-type-tiny.hash | 8 ++++----
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-type-tiny/Config.in b/package/perl-type-tiny/Config.in
index c49a0d4bb8..96e5ea1350 100644
--- a/package/perl-type-tiny/Config.in
+++ b/package/perl-type-tiny/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_TYPE_TINY
 	help
 	  tiny, yet Moo(se)-compatible type constraint.
 
-	  https://metacpan.org/release/Type-Tiny
+	  http://typetiny.toby.ink/
diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index d6b3639dcf..8263e14c9d 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a7fe90a6d53d2cd57381e60e682f828f Type-Tiny-1.004004.tar.gz
-sha256 081281ea004cdd89003d938aa52c1398e24411dd8f7163b14d0977a13f7062be Type-Tiny-1.004004.tar.gz
+md5    04194fe9673ef5504be9d50aa5d6782a Type-Tiny-1.008003.tar.gz
+sha256 a44e6e3ab29f05516d2a670de817278a7a06d55bce6f4ceaeb84ce032dcd00f5 Type-Tiny-1.008003.tar.gz
 
 # computed by scancpan
-sha256 57e58f271bf6bca0bb22ab9e72b04c9e12010b0a898453a2fcde49fb9ff28afc COPYRIGHT
-sha256 5c791221f0dde289392a38a5921b66d4a1be8248cc64ee6de15f3c2426892673 LICENSE
+sha256 7cf4a3f3f81896130c0bc8041fddd737052cdf28e1bd8af7046884f63f262e53 COPYRIGHT
+sha256 1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25 LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index aa7306416b..ea1290bb2a 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.004004
+PERL_TYPE_TINY_VERSION = 1.008003
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
