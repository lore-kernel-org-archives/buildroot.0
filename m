From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 08:42:46 +0100
Subject: [Buildroot] [PATCH] perl-xml-parser: fix build
Message-ID: <1393659766-25759-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(missing when changing the naming scheme of Perl modules)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-xml-parser/perl-xml-parser.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
index fb9bf0f..f46f1f5 100644
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -10,7 +10,7 @@ PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR/
 PERL_XML_PARSER_DEPENDENCIES = expat
 PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
 
-HOST_LIBXML_PARSER_PERL_CONF_OPT = \
+HOST_PERL_XML_PARSER_CONF_OPT = \
 	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
 	EXPATINCPATH=$(HOST_DIR)/usr/include
 
-- 
1.7.9.5
