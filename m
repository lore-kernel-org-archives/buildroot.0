From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:09 +0100
Subject: [Buildroot] [PATCH 03/14] perl-try-tiny: bump to version 0.30
In-Reply-To: <20180117174520.29545-1-francois.perrad@gadz.org>
References: <20180117174520.29545-1-francois.perrad@gadz.org>
Message-ID: <20180117174520.29545-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-try-tiny/perl-try-tiny.hash | 4 ++--
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index c6dbd44f4..85f604011 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e2f8af601a62981aab30df15a6f47475 Try-Tiny-0.28.tar.gz
-sha256 f1d166be8aa19942c4504c9111dade7aacb981bc5b3a2a5c5f6019646db8c146 Try-Tiny-0.28.tar.gz
+md5    eb362c3cb32c42f9f28de9ddb7f2ead6 Try-Tiny-0.30.tar.gz
+sha256 da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b Try-Tiny-0.30.tar.gz
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index b4d35ab19..f9113e706 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.28
+PERL_TRY_TINY_VERSION = 0.30
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-- 
2.11.0
