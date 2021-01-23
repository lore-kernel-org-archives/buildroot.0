From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:46 +0100
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 1.012001
Message-ID: <20210123200716.7669380296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e9f0fb0edde5092e63a5b04ef773cc9d0643d3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is copyright (c) 2020 by Toby Inkster.
+This software is copyright (c) 2021 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-type-tiny/Config.in           | 2 +-
 package/perl-type-tiny/perl-type-tiny.hash | 6 +++---
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-type-tiny/Config.in b/package/perl-type-tiny/Config.in
index 96e5ea1350..5ee3db6f9b 100644
--- a/package/perl-type-tiny/Config.in
+++ b/package/perl-type-tiny/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_TYPE_TINY
 	help
 	  tiny, yet Moo(se)-compatible type constraint.
 
-	  http://typetiny.toby.ink/
+	  https://typetiny.toby.ink/
diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 0c14b7d0cc..2e2726e38d 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  6b7976fe3a6687a3ffdd5ab2b3b11931  Type-Tiny-1.012000.tar.gz
-sha256  d3db1220161c2aea6b0b8a2225c4fef526e8dbbe56b4bffe9daabc03e2efea90  Type-Tiny-1.012000.tar.gz
+md5  7feab0f3f99810290a3fdea8dbf24d7b  Type-Tiny-1.012001.tar.gz
+sha256  f907e5ad880fcc42fddb7e0de53c59429282abcbb3afb1a8651bf5ec6c42954d  Type-Tiny-1.012001.tar.gz
 
 # computed by scancpan
-sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
+sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index dbaeebd8b4..2a475e53db 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012000
+PERL_TYPE_TINY_VERSION = 1.012001
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
