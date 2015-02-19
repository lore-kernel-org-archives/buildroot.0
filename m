From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:43:23 +0100
Subject: [Buildroot] [git commit branch/next] perl-xml-libxml: bump to
	version 2.0118
Message-ID: <20150219214342.5AE48817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75d757d69e770c192c5635f368a13a68b1a320e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-libxml/0001-Makefile-PL.patch |    2 +-
 package/perl-xml-libxml/perl-xml-libxml.hash   |    4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-xml-libxml/0001-Makefile-PL.patch b/package/perl-xml-libxml/0001-Makefile-PL.patch
index ce2724c..e043c6d 100644
--- a/package/perl-xml-libxml/0001-Makefile-PL.patch
+++ b/package/perl-xml-libxml/0001-Makefile-PL.patch
@@ -6,7 +6,7 @@ Index: b/Makefile.PL
 ===================================================================
 --- a/Makefile.PL
 +++ b/Makefile.PL
-@@ -84,8 +84,7 @@
+@@ -88,8 +88,7 @@
  # -------------------------------------------------------------------------- #
  # -------------------------------------------------------------------------- #
  
diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index db30300..37d8b3d 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    484308164ecab1d7d0eddf4dc4c9c0ca XML-LibXML-2.0117.tar.gz
-sha256 5767c90f34ffd3762d7800a64c7190a2635c941a41a73e1156fa791b0652bac0 XML-LibXML-2.0117.tar.gz
+md5    da8d61a5d0d1bfd8d46814e376d33f58 XML-LibXML-2.0118.tar.gz
+sha256 cc64ae26ef5ebc0f64ba292c582f1cd70701c6513133a063e2d25c3257430c9c XML-LibXML-2.0118.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 94681e5..e93623c 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0117
+PERL_XML_LIBXML_VERSION = 2.0118
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
