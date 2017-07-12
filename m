From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:46:51 -0700
Subject: [Buildroot] [PATCH] libxml-parser-perl: add LICENSE_FILES
Message-ID: <20170712024651.21497-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ben Leinweber <bleinweber@spaceflight.com>

There is copyright information in the top level README file. Use this
file as the license file which will be included by the `legal-info`
build rule.

Signed-off-by: Ben Leinweber <bleinweber@spaceflight.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 4a3b196..514c457 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -9,6 +9,7 @@ LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
+LIBXML_PARSER_PERL_LICENSE_FILES = README
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
-- 
2.9.4
