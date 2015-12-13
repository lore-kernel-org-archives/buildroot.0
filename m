From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 21:52:18 +0100
Subject: [Buildroot] [PATCH 4/4] package/perl-xml-libxml: bump version to
	2.0123
In-Reply-To: <1450039938-32320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450039938-32320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450039938-32320-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index b2b6518..782cf5c 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8bf504427a44ed6b84be807b55684271 XML-LibXML-2.0122.tar.gz
-sha256 767663f819d2cc579422f773375aadbeab127dc6510a77f2f9ff70e6e29b8f52 XML-LibXML-2.0122.tar.gz
+md5    c9eb502f8aa2586c4a4dce3c784a2a0b XML-LibXML-2.0123.tar.gz
+sha256 0525a2491f152cadee8c63550c79a380fb393851fdfc4c1e6cd5f0f92614f7c4 XML-LibXML-2.0123.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 8867c93..9d7216a 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0122
+PERL_XML_LIBXML_VERSION = 2.0123
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-sax perl-xml-namespacesupport
-- 
2.6.2
