From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:31:39 +0100
Subject: [Buildroot] [git commit] perl-xml-libxml: bump to version 2.0128
Message-ID: <20170120194046.8E91380DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=171cd2c5cc2220b5a5f25d96b526132a9840de23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index 1d42bf2..b6195c3 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c6007524ddec3be6cfbb8f68f5aa791c XML-LibXML-2.0126.tar.gz
-sha256 0e735ab72e2ba77070a58a737fd6c61fa6aa198527abc59a5d5627f0650a60af XML-LibXML-2.0126.tar.gz
+md5    9904690371679e082ff2c23677b6c90e XML-LibXML-2.0128.tar.gz
+sha256 26e7ba451f3bade4d29ff00653a2ee01d13fe38b9a2ebcd0b0f3f82f9f688f2b XML-LibXML-2.0128.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 66c606b..8d8f590 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0126
+PERL_XML_LIBXML_VERSION = 2.0128
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
