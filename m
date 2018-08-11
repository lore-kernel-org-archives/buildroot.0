From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:34 -0700
Subject: [Buildroot] [PATCH 02/17] perl-html-parser: add host
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-html-parser/perl-html-parser.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 66016eb8b0..f519e90699 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -8,7 +8,9 @@ PERL_HTML_PARSER_VERSION = 3.72
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
+HOST_PERL_HTML_PARSER_DEPENDENCIES = host-perl-html-tagset
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = README
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.14.4
