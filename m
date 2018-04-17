From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Apr 2018 05:25:57 +0200
Subject: [Buildroot] [PATCH] perl: bump to version 5.26.2
Message-ID: <20180417032557.5077-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 14e6b117c..210f6d581 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz.{md5,sha1,sha256}.txt
-md5    70e988b4318739b0cf3ad5e120bfde88                                 perl-5.26.1.tar.xz
-sha1   403bb1804cb41416153d908eea093f2be22a77f6                         perl-5.26.1.tar.xz
-sha256 fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680 perl-5.26.1.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.2.tar.xz.{md5,sha1,sha256}.txt
+md5    1fa1b53eeff76aa37b17bfc9b2771671                                 perl-5.26.2.tar.xz
+sha1   bfa5c7921ed7bf5e035dbf2f7ff81367b81e372c                         perl-5.26.2.tar.xz
+sha256 0f8c0fb1b0db4681adb75c3ba0dd77a0472b1b359b9e80efd79fc27b4352132c perl-5.26.2.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.8/perl-cross-1.1.8.hash
-sha256	08e626ed9c419b8a695a8762ff8b41a553023175e4ad67b5e858fc9b4322521c  perl-cross-1.1.8.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.9/perl-cross-1.1.9.hash
+sha256	0bbb450e48d07e7fdf867d578b1780ac8f0e8dc284d52301dac4d763b42f6041  perl-cross-1.1.9.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 58bf3eb6a..7b4a2710b 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 26
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.8
+PERL_CROSS_VERSION = 1.1.9
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.11.0
