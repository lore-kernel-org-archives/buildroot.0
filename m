From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 12:55:53 +0100
Subject: [Buildroot] [git commit] perl-xml-parser: fix build
Message-ID: <20140301115611.AAE8D9BC7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff7de87fce8c0be5506fbfd851a01a21cff67941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(missing when changing the naming scheme of Perl modules)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-parser/perl-xml-parser.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
