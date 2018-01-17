From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:07 +0100
Subject: [Buildroot] [PATCH 01/14] perl-xml-libxml: bump to version 2.0132
Message-ID: <20180117174520.29545-1-francois.perrad@gadz.org>
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
index 092ec15d6..bbe841a60 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5806b69d54a2d7884b8d22b395888436 XML-LibXML-2.0129.tar.gz
-sha256 5ca0269ba06800c84061a7f3333c85fab5584d69cd7b4e0641963da7fd36b366 XML-LibXML-2.0129.tar.gz
+md5    43546fd9a3974f19323f9fb04861ece9 XML-LibXML-2.0132.tar.gz
+sha256 721452e3103ca188f5968ab06d5ba29fe8e00e49f4767790882095050312d476 XML-LibXML-2.0132.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 8ef6fcbc2..ff831bb07 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0129
+PERL_XML_LIBXML_VERSION = 2.0132
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
-- 
2.11.0
