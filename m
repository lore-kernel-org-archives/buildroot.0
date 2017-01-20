From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 20 Jan 2017 10:29:56 +0100
Subject: [Buildroot] [PATCH 03/12] perl-try-tiny: bump to version 0.28
In-Reply-To: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
References: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1484904605-11239-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-try-tiny/Config.in          | 4 ++--
 package/perl-try-tiny/perl-try-tiny.hash | 4 ++--
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-try-tiny/Config.in b/package/perl-try-tiny/Config.in
index ea25589..5c115b6 100644
--- a/package/perl-try-tiny/Config.in
+++ b/package/perl-try-tiny/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TRY_TINY
 	bool "perl-try-tiny"
 	help
-	  minimal try/catch with proper preservation of $@
+	  Minimal try/catch with proper preservation of $@
 
-	  https://github.com/karenetheridge/Try-Tiny
+	  https://github.com/p5sagit/Try-Tiny
diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index dc44f18..c6dbd44 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1a12a51cfeb7e2c301e4ae093c7ecdfb Try-Tiny-0.24.tar.gz
-sha256 9b7a1af24c0256973d175369ebbdc25ec01e2452a97f2d3ab61481c826f38d81 Try-Tiny-0.24.tar.gz
+md5    e2f8af601a62981aab30df15a6f47475 Try-Tiny-0.28.tar.gz
+sha256 f1d166be8aa19942c4504c9111dade7aacb981bc5b3a2a5c5f6019646db8c146 Try-Tiny-0.28.tar.gz
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index f033197..b4d35ab 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.24
+PERL_TRY_TINY_VERSION = 0.28
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-- 
2.7.4
