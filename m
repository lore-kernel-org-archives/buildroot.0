From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 12:18:03 +0200
Subject: [Buildroot] [git commit] package/perl-xml-libxml: add CPE variables
Message-ID: <20210404095325.10A7988278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d9863c8248943e9bd5d3761cfd8306013fb8c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xml-libxml_project:xml-libxml is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axml-libxml_project%3Axml-libxml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-xml-libxml/perl-xml-libxml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 23d3e988fa..9b563e29b5 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -10,6 +10,8 @@ PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
 PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
+PERL_XML_LIBXML_CPE_ID_VENDOR = xml-libxml_project
+PERL_XML_LIBXML_CPE_ID_PRODUCT = xml-libxml
 PERL_XML_LIBXML_DISTNAME = XML-LibXML
 
 PERL_XML_LIBXML_CONF_OPTS = \
