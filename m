From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 14:03:15 +0100
Subject: [Buildroot] [git commit] perl: bump to version 5.24.1
Message-ID: <20170123130413.59E5481926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deebd39aa487e88163d1a1f0b5d8241eb3f178d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 5c1668b..41c1ce8 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.0.tar.xz.{md5,sha1,sha256}.txt
-md5    59456ae4bd4b06cb6e57cb19a3b2d349                                 perl-5.24.0.tar.xz
-sha1   9d5424ac2debe979d1f7255fe0c818aff0b41b4c                         perl-5.24.0.tar.xz
-sha256 a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2 perl-5.24.0.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.1.tar.xz.{md5,sha1,sha256}.txt
+md5    af6a84c7c3e2b8b269c105a5db2f6d53                                 perl-5.24.1.tar.xz
+sha1   5bec25d8821b81a5939ee220997f4c8ab1c13e31                         perl-5.24.1.tar.xz
+sha256 03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f perl-5.24.1.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.2/perl-cross-1.1.2.hash
-sha256 2a1b0a3ffe866bc3fd32c947c0a866360d2f26576c8f1c5c0b521d3a6e9d643d perl-cross-1.1.2.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.3/perl-cross-1.1.3.hash
+sha256 181b24ff71815fb2c8065e6ea139d106796eee0964aebfd8081f0b7f69e0696d perl-cross-1.1.3.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f07a8e2..224b4cb 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update support/scripts/scancpan
 PERL_VERSION_MAJOR = 24
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.2
+PERL_CROSS_VERSION = 1.1.3
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
