From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2015 16:38:51 +0200
Subject: [Buildroot] [V2 6/6] perl-xml-libxml: bump to version 2.0121
In-Reply-To: <1437748731-31026-1-git-send-email-francois.perrad@gadz.org>
References: <1437748731-31026-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437748731-31026-6-git-send-email-francois.perrad@gadz.org>
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
index 37d8b3d..516aaef 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    da8d61a5d0d1bfd8d46814e376d33f58 XML-LibXML-2.0118.tar.gz
-sha256 cc64ae26ef5ebc0f64ba292c582f1cd70701c6513133a063e2d25c3257430c9c XML-LibXML-2.0118.tar.gz
+md5    1544ab9ac110f5da296015346561ce02 XML-LibXML-2.0121.tar.gz
+sha256 ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9 XML-LibXML-2.0121.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index e93623c..d58a1f3 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0118
+PERL_XML_LIBXML_VERSION = 2.0121
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
-- 
2.1.4
