From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 10 Jun 2019 10:33:24 +0200
Subject: [Buildroot] [PATCH 5/5] package/perl-www-form-urlencoded: bump to
 version 0.26
In-Reply-To: <20190610083324.7607-1-francois.perrad@gadz.org>
References: <20190610083324.7607-1-francois.perrad@gadz.org>
Message-ID: <20190610083324.7607-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-www-form-urlencoded/perl-www-form-urlencoded.hash    | 4 ++--
 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
index 2ad969a12..c4ed48890 100644
--- a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c7f8fbd616f9a342b5ff726b405d2a96 WWW-Form-UrlEncoded-0.25.tar.gz
-sha256 e1f7a6d22fe558242d1df584229d99058f63ef2658e43b8a90642e3875c6074e WWW-Form-UrlEncoded-0.25.tar.gz
+md5    cbe0e1c3ee54738d900c739ea348efda WWW-Form-UrlEncoded-0.26.tar.gz
+sha256 c0480b5f1f15b71163ec327b8e7842298f0cb3ace97e63d7034af1e94a2d90f4 WWW-Form-UrlEncoded-0.26.tar.gz
 
 # computed by scancpan
 sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
index a0ccba531..a6f2edd5e 100644
--- a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_WWW_FORM_URLENCODED_VERSION = 0.25
+PERL_WWW_FORM_URLENCODED_VERSION = 0.26
 PERL_WWW_FORM_URLENCODED_SOURCE = WWW-Form-UrlEncoded-$(PERL_WWW_FORM_URLENCODED_VERSION).tar.gz
 PERL_WWW_FORM_URLENCODED_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_WWW_FORM_URLENCODED_DEPENDENCIES = host-perl-module-build
-- 
2.20.1
