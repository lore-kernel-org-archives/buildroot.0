From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:17:52 +0100
Subject: [Buildroot] [git commit] package/perl-apache-logformat-compiler:
 bump to version 0.36
Message-ID: <20191205221012.6CC8D813E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e7eb08a71f6d7efb777342c2f9754b15ecb93b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-apache-logformat-compiler.hash                               | 4 ++--
 .../perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
index 5466435c5a..de33cfb17b 100644
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
index 59290f376e..82ceb7979f 100644
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
