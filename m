From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 21 Mar 2020 14:02:40 +0100
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.30.2
Message-ID: <20200321130240.16914-1-francois.perrad@gadz.org>
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
index 161a4fd61..74791c0b0 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.1.tar.xz.{md5,sha1,sha256}.txt
-md5    f399f3aaee90ddcff5eadd3bccdaacc0                                 perl-5.30.1.tar.xz
-sha1   4bc190b6ac368f573e6a028f91430f831d40d30a                         perl-5.30.1.tar.xz
-sha256 7336cd3ed0535eb61b76a71350effcfa7c88b44faf37d64d70952ced5d38cd35 perl-5.30.1.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.2.tar.xz.{md5,sha1,sha256}.txt
+md5    4bfa12b528522a50de0470b8b70b9b3b                                 perl-5.30.2.tar.xz
+sha1   d82cdaa610a3e749e821fc77004b1b4bfd5ebd28                         perl-5.30.2.tar.xz
+sha256 a1aa88bd6fbbdc2e82938afbb76c408b0ea847317737b712dc196cc7907a5259 perl-5.30.2.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.1/perl-cross-1.3.1.hash
-sha256	edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d1590551e40694f21200141d perl-cross-1.3.1.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.2/perl-cross-1.3.2.hash
+sha256	defa12f0ad7be0b6c48b4f76e2fb5b37c1b37fbeb6e9ebe938279cd539a0c20c  perl-cross-1.3.2.tar.gz
 
 # Locally calculated
 sha256 dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2 Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0ab81ddb3..c865fc768 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 30
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.1
+PERL_CROSS_VERSION = 1.3.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.20.1
