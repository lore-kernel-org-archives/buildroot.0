From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:43 +0100
Subject: [Buildroot] [PATCH 1/8] package/perl-apache-logformat-compiler:
 bump to version 0.36
Message-ID: <20191204083351.6134-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-apache-logformat-compiler.hash                       | 4 ++--
 .../perl-apache-logformat-compiler.mk                         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
index 5466435c5..de33cfb17 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    cbb0bf041ade8a39f65eadbdf8a346c1 Apache-LogFormat-Compiler-0.35.tar.gz
-sha256 1654c0000a042a8af052616e30b91c1f0b95a720c8048b59168a8bd99b07271a Apache-LogFormat-Compiler-0.35.tar.gz
+md5    a0cdfcd875cb2ee4dc9a2c24381eb55b Apache-LogFormat-Compiler-0.36.tar.gz
+sha256 94509503ee74ea820183d070c11630ee5bc0fd8c12cb74fae953ed62e4a1ac17 Apache-LogFormat-Compiler-0.36.tar.gz
 
 # computed by scancpan
 sha256 ab941cfc4794afa2113795b167177d1b25cbc77ebadd016e5727effc2cadd96b LICENSE
diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
index 59290f376..82ceb7979 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_APACHE_LOGFORMAT_COMPILER_VERSION = 0.35
+PERL_APACHE_LOGFORMAT_COMPILER_VERSION = 0.36
 PERL_APACHE_LOGFORMAT_COMPILER_SOURCE = Apache-LogFormat-Compiler-$(PERL_APACHE_LOGFORMAT_COMPILER_VERSION).tar.gz
 PERL_APACHE_LOGFORMAT_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.20.1
