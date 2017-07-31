From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:21:25 +0200
Subject: [Buildroot] [git commit] perl: bump version 5.24.2
Message-ID: <20170731191718.533BA7FAA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02ca51f63ec72d4f6c4eb627b0919e6b9ea1b428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index eb88b9e..b46189a 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.1.tar.xz.{md5,sha1,sha256}.txt
-md5    af6a84c7c3e2b8b269c105a5db2f6d53                                 perl-5.24.1.tar.xz
-sha1   5bec25d8821b81a5939ee220997f4c8ab1c13e31                         perl-5.24.1.tar.xz
-sha256 03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f perl-5.24.1.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.2.tar.xz.{md5,sha1,sha256}.txt
+md5    b7c027975a476dbb9aa7202f760d8eca                                 perl-5.24.2.tar.xz
+sha1   61761989df70b10470bc387050974be72e33217e                         perl-5.24.2.tar.xz
+sha256 b25dd465ef32edf853078eb540b26243db0a3b5e1b1cc84393703d9564be67c0 perl-5.24.2.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.5/perl-cross-1.1.5.hash
-sha256	0e719e75983b16c7726c2c9462f9498bb1fc4ad38c9f2513a65f3dd34e3decb3  perl-cross-1.1.5.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.6/perl-cross-1.1.6.hash
+sha256	2b3b88f54d85beb438bd2dddd948e2d89461db5ab6253f01b3c2c9ae3ddc30b4  perl-cross-1.1.6.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index fb0cec3..d7fcd75 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update support/scripts/scancpan
 PERL_VERSION_MAJOR = 24
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.5
+PERL_CROSS_VERSION = 1.1.6
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
