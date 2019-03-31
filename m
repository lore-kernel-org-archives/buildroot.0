From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:48 +0200
Subject: [Buildroot] [PATCH 13/14] package/perl-sub-quote: bump to version
 2.006003
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-13-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-sub-quote/perl-sub-quote.hash | 7 ++-----
 package/perl-sub-quote/perl-sub-quote.mk   | 3 +--
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 8af5e2c07..75cddcba1 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1b0f288ca8c60243f9bc29cfee4c4986 Sub-Quote-2.005001.tar.gz
-sha256 d6ab4f0775def015367a05e02024b403f991b2be11d774f3d235fe7e9bdbba07 Sub-Quote-2.005001.tar.gz
-
-# computed by scancpan
-sha256 8f7a1d60c718174b7752562007b2643d4a1c23f901cbeb7774015805efe0a817 README
+md5    ca8ed234f10b822d18b1bfb9734797a7 Sub-Quote-2.006003.tar.gz
+sha256 be1f3a6f773f351f203cdc8f614803ac492b77d15fd68d5b1f0cd3884be18176 Sub-Quote-2.006003.tar.gz
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 1e364f213..3791723ff 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.005001
+PERL_SUB_QUOTE_VERSION = 2.006003
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
-PERL_SUB_QUOTE_LICENSE_FILES = README
 PERL_SUB_QUOTE_DISTNAME = Sub-Quote
 
 $(eval $(perl-package))
-- 
2.17.1
