From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:49 +0200
Subject: [Buildroot] [PATCH 14/14] package/perl-xml-libxml: bump to version
 2.0134
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-14-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index a3f4d5d64..4842f4fec 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    43546fd9a3974f19323f9fb04861ece9 XML-LibXML-2.0132.tar.gz
-sha256 721452e3103ca188f5968ab06d5ba29fe8e00e49f4767790882095050312d476 XML-LibXML-2.0132.tar.gz
+md5    dce687dd8b7e82d1c359fd74b1852f64 XML-LibXML-2.0134.tar.gz
+sha256 f0bca4d0c2da35d879fee4cd13f352014186cedab27ab5e191f39b5d7d4f46cf XML-LibXML-2.0134.tar.gz
 
 # computed by scancpan
 sha256 5046a7ec515cc1542beafdf2eadeeff24cc221fc3fde9913dd144fd263ae6100 LICENSE
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 3218d34d5..23d3e988f 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0132
+PERL_XML_LIBXML_VERSION = 2.0134
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
-- 
2.17.1
