From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Apr 2020 14:24:16 +0200
Subject: [Buildroot] [PATCH] package/perl: bump perl-cross to version 1.3.3
Message-ID: <20200423122416.23085-1-francois.perrad@gadz.org>
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
index 7c153fedb..21704a8bb 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,8 +3,8 @@ md5  4bfa12b528522a50de0470b8b70b9b3b  perl-5.30.2.tar.xz
 sha1  d82cdaa610a3e749e821fc77004b1b4bfd5ebd28  perl-5.30.2.tar.xz
 sha256  a1aa88bd6fbbdc2e82938afbb76c408b0ea847317737b712dc196cc7907a5259  perl-5.30.2.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.2/perl-cross-1.3.2.hash
-sha256  defa12f0ad7be0b6c48b4f76e2fb5b37c1b37fbeb6e9ebe938279cd539a0c20c  perl-cross-1.3.2.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.3/perl-cross-1.3.3.hash
+sha256  3cea71d443cd28c6aa3c3c79d6db38267303cfac8e54b8a6d7ef8d448deefb25  perl-cross-1.3.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index c865fc768..64d453cad 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,7 +13,7 @@ PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.2
+PERL_CROSS_VERSION = 1.3.3
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.20.1
