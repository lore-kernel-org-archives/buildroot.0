From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:37:11 +0200
Subject: [Buildroot] [git commit] perl-cross: bump to version 1.1.5
Message-ID: <20170606193715.E7FFE8274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=017d105a6f30b450303effdbdcbac9905c94e870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index b815295..eb88b9e 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,5 +3,5 @@ md5    af6a84c7c3e2b8b269c105a5db2f6d53                                 perl-5.2
 sha1   5bec25d8821b81a5939ee220997f4c8ab1c13e31                         perl-5.24.1.tar.xz
 sha256 03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f perl-5.24.1.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.4/perl-cross-1.1.4.hash
-sha256 c840a327d5464ca271cac40d52e2d199330875527bf1003c28a6e550fb7bcc57 perl-cross-1.1.4.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.5/perl-cross-1.1.5.hash
+sha256	0e719e75983b16c7726c2c9462f9498bb1fc4ad38c9f2513a65f3dd34e3decb3  perl-cross-1.1.5.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 130441f..ca23eb0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.4
+PERL_CROSS_VERSION = 1.1.5
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
