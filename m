From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:41 +0100
Subject: [Buildroot] [PATCH resend 07/22] libxml-parser-perl: removed
	redundant HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index ecc2cc9..9e6f2ec 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -8,7 +8,6 @@ LIBXML_PARSER_PERL_SOURCE:=XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
 
 LIBXML_PARSER_PERL_DEPENDENCIES = expat
-HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
  (cd $(@D) ; \
-- 
1.7.8.3
