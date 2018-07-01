From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  1 Jul 2018 20:06:00 +0200
Subject: [Buildroot] [PATCH] perl-cross: bump to version 1.2
Message-ID: <20180701180600.15623-1-francois.perrad@gadz.org>
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
index 210f6d581..6936b22e0 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,5 +3,5 @@ md5    1fa1b53eeff76aa37b17bfc9b2771671                                 perl-5.2
 sha1   bfa5c7921ed7bf5e035dbf2f7ff81367b81e372c                         perl-5.26.2.tar.xz
 sha256 0f8c0fb1b0db4681adb75c3ba0dd77a0472b1b359b9e80efd79fc27b4352132c perl-5.26.2.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.9/perl-cross-1.1.9.hash
-sha256	0bbb450e48d07e7fdf867d578b1780ac8f0e8dc284d52301dac4d763b42f6041  perl-cross-1.1.9.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2/perl-cross-1.2.hash
+sha256	599077beb86af5e6097da8922a84474a5484f61475d2899eae0f8634e9619109  perl-cross-1.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f7e5604ed..b0eea3eff 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.9
+PERL_CROSS_VERSION = 1.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.17.1
