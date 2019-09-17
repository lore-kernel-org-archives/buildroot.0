From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:23:57 +0200
Subject: [Buildroot] [git commit] package/perl-class-method-modifiers: bump
 to version 2.13
Message-ID: <20190917201941.3C37F8E9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c80644ce5a5f4a177abcb88d436eec4305c0813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-class-method-modifiers/perl-class-method-modifiers.hash | 4 ++--
 package/perl-class-method-modifiers/perl-class-method-modifiers.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
index 540f357b6c..82bf91f74c 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f55400c7a8134acf3657f8af89bdd7af Class-Method-Modifiers-2.12.tar.gz
-sha256 e44c1073020bf55b8c97975ed77235fd7e2a6a56f29b5c702301721184e27ac8 Class-Method-Modifiers-2.12.tar.gz
+md5    b1398e3682aa2e075b913b9f9000b596 Class-Method-Modifiers-2.13.tar.gz
+sha256 ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63 Class-Method-Modifiers-2.13.tar.gz
 
 # computed by scancpan
 sha256 d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561 LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index e93553f964..ef688acf7e 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.12
+PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.13
 PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
