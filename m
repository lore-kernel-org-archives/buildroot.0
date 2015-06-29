From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 29 Jun 2015 09:03:17 +0200
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.7
Message-ID: <1435561397-27221-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix some build failures,
see https://github.com/arsv/perl-cross/issues/17

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 2 +-
 package/perl/perl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index d28b5fd..0ee587e 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -4,4 +4,4 @@ sha1   63126c683b4c79c35008a47d56f7beae876c569f                         perl-5.2
 sha256 e5a4713bc65e1da98ebd833dce425c000768bfe84d17ec5183ec5ca249db71ab perl-5.20.2.tar.bz2
 
 # No upstream hashes for the following
-sha256 e25c5d9289b98db8f9d6a27bda9de12028ffc37eeede2d2fbfb10590d36fbf8f perl-5.20.2-cross-0.9.6.tar.gz
+sha256 36cabbc937cc66e59c8ae414d7753190d54a022cae0012c09ee5bbee78bc0aa0 perl-5.20.2-cross-0.9.7.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 6f3cd49..591fa2e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,7 +12,7 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.6
+PERL_CROSS_VERSION = 0.9.7
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
-- 
2.1.4
