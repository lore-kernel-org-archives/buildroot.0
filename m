From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 31 Oct 2017 19:04:02 +0100
Subject: [Buildroot] [PATCH] perl-cross: bump to version 1.1.8
Message-ID: <20171031180402.16955-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 6892a643c..14e6b117c 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,5 +3,5 @@ md5    70e988b4318739b0cf3ad5e120bfde88                                 perl-5.2
 sha1   403bb1804cb41416153d908eea093f2be22a77f6                         perl-5.26.1.tar.xz
 sha256 fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680 perl-5.26.1.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.7/perl-cross-1.1.7.hash
-sha256	b79ce9d766b5f527ad7e73cb86d541da88ecbb69a443ee5f14658dd8f9e9415f  perl-cross-1.1.7.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.8/perl-cross-1.1.8.hash
+sha256	08e626ed9c419b8a695a8762ff8b41a553023175e4ad67b5e858fc9b4322521c  perl-cross-1.1.8.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 02cfec807..58bf3eb6a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.7
+PERL_CROSS_VERSION = 1.1.8
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.11.0
