From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 Apr 2016 12:00:46 +0200
Subject: [Buildroot] [PATCH] perl: bump to version 5.22.2
Message-ID: <1462010446-537-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 8 ++++----
 package/perl/perl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 3f1bd1a..4afbd06 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.1.tar.bz2.{md5,sha1,sha256}.txt
-md5    67242b9bd642b458bec884ed2a040910                                 perl-5.22.1.tar.bz2
-sha1   29f9b320b0299577a3e1d02e9e8ef8f26f160332                         perl-5.22.1.tar.bz2
-sha256 e98e4075a3167fa40524abe447c30bcca10c60e02a54ee1361eff278947a1221 perl-5.22.1.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.2.tar.bz2.{md5,sha1,sha256}.txt
+md5    24ec0b41fdd1a4cce0e66811ae1f5e1b                                 perl-5.22.2.tar.bz2
+sha1   e2f465446dcd45a7fa3da696037f9ebe73e78e55                         perl-5.22.2.tar.bz2
+sha256 f2322b9b04fe0cdbca9fe755360da04892cb6483d44959457cfebc0bcddc8058 perl-5.22.2.tar.bz2
 
 # No upstream hashes for the following
 sha256 250ab6e6c034a8b7ae447fa2b453fa0b61ebb7db4d039eba60c52e44ab5899bd perl-5.22.1-cross-1.0.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0bd10ad..11b10ff 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PERL_VERSION_MAJOR = 22
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
-- 
2.5.0
