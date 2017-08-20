From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:28 +0200
Subject: [Buildroot] [PATCH 15/18] perl-xml-libxml: bump to version 2.0129
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-15-francois.perrad@gadz.org>
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
index b6195c3b9..092ec15d6 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9904690371679e082ff2c23677b6c90e XML-LibXML-2.0128.tar.gz
-sha256 26e7ba451f3bade4d29ff00653a2ee01d13fe38b9a2ebcd0b0f3f82f9f688f2b XML-LibXML-2.0128.tar.gz
+md5    5806b69d54a2d7884b8d22b395888436 XML-LibXML-2.0129.tar.gz
+sha256 5ca0269ba06800c84061a7f3333c85fab5584d69cd7b4e0641963da7fd36b366 XML-LibXML-2.0129.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 69cf57ca3..8ef6fcbc2 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0128
+PERL_XML_LIBXML_VERSION = 2.0129
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
-- 
2.11.0
