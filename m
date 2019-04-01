From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:07:56 +0200
Subject: [Buildroot] [git commit] package/perl-xml-libxml: bump to version
 2.0134
Message-ID: <20190401200604.A80CB8B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0776986358c374d2ea0f969adf7a20275cdcff23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index a3f4d5d643..4842f4fec2 100644
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
index 3218d34d53..23d3e988fa 100644
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
