From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 13:06:43 +0100
Subject: [Buildroot] [git commit] package/perl: change tarball compression
	to xz
Message-ID: <20170106120945.EEE0A81EA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0689a2f8da3209e03d22114dfd0f43ba79fb8d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 9c40a53..5c1668b 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.0.tar.bz2.{md5,sha1,sha256}.txt
-md5    99f39abe614b50719d9915431e54fc1e                                 perl-5.24.0.tar.bz2
-sha1   298fa605138c1a00dab95643130ae0edab369b4d                         perl-5.24.0.tar.bz2
-sha256 62328a53d157e8153b33e137594155f6f8b64418f7f9238210feb809585290e0 perl-5.24.0.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.24.0.tar.xz.{md5,sha1,sha256}.txt
+md5    59456ae4bd4b06cb6e57cb19a3b2d349                                 perl-5.24.0.tar.xz
+sha1   9d5424ac2debe979d1f7255fe0c818aff0b41b4c                         perl-5.24.0.tar.xz
+sha256 a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2 perl-5.24.0.tar.xz
 
 # Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.2/perl-cross-1.1.2.hash
 sha256 2a1b0a3ffe866bc3fd32c947c0a866360d2f26576c8f1c5c0b521d3a6e9d643d perl-cross-1.1.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f808a47..f07a8e2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -8,7 +8,7 @@
 PERL_VERSION_MAJOR = 24
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = http://www.cpan.org/src/5.0
-PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
+PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
