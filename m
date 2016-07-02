From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:56 +0200
Subject: [Buildroot] [PATCH 27/69] libxml-parser-perl: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-28-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 5c2ac546b48a..9e5325c863e1 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -7,7 +7,7 @@
 LIBXML_PARSER_PERL_VERSION = 2.41
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-LIBXML_PARSER_PERL_DEPENDENCIES = expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPLv1+
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
-- 
2.1.0
