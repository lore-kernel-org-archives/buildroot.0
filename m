From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:34 +0100
Subject: [Buildroot] [git commit] libxml-parser-perl: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.751CB90370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b116eb0f2732c9a7e8f6885f3beca434623fc1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
