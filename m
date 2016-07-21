From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Jul 2016 21:08:51 +0200
Subject: [Buildroot] [PATCH 2/6] perl-html-parser: bump to version 3.72
In-Reply-To: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
References: <1469128135-10250-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1469128135-10250-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-html-parser/Config.in             | 5 ++---
 package/perl-html-parser/perl-html-parser.hash | 4 ++--
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index 8a725f1..22a16d6 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -3,10 +3,9 @@ config BR2_PACKAGE_PERL_HTML_PARSER
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_HTML_TAGSET
 	help
-	  The HTML-Parser distribution is is a collection of modules that parse
-	  and extract information from HTML documents
+	  HTML parser class
 
-	  http://github.com/gisle/html-parser
+	  https://metacpan.org/release/HTML-Parser
 
 comment "perl-html-parser needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index eed22b7..0c0bb1f 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9128a45893097dfa3bf03301b19c5efe HTML-Parser-3.71.tar.gz
-sha256 be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802 HTML-Parser-3.71.tar.gz
+md5    eb7505e5f626913350df9dd4a03d54a8 HTML-Parser-3.72.tar.gz
+sha256 ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b HTML-Parser-3.72.tar.gz
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 18d25c5..14a2826 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.71
+PERL_HTML_PARSER_VERSION = 3.72
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
-- 
1.9.1
