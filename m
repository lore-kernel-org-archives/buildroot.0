From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:58 +0200
Subject: [Buildroot] [PATCH 11/11] perl-xml-libxml: bump to version 2.0122
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-11-git-send-email-francois.perrad@gadz.org>
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
index 516aaef..b2b6518 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1544ab9ac110f5da296015346561ce02 XML-LibXML-2.0121.tar.gz
-sha256 ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9 XML-LibXML-2.0121.tar.gz
+md5    8bf504427a44ed6b84be807b55684271 XML-LibXML-2.0122.tar.gz
+sha256 767663f819d2cc579422f773375aadbeab127dc6510a77f2f9ff70e6e29b8f52 XML-LibXML-2.0122.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 5717841..8867c93 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0121
+PERL_XML_LIBXML_VERSION = 2.0122
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-sax perl-xml-namespacesupport
-- 
2.5.0
