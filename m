From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:41:03 +0200
Subject: [Buildroot] [git commit branch/next] perl-xml-libxml: bump to
	version 2.0129
Message-ID: <20170821214003.441CE821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fed1a77e7984540db91f9f9b92badf8c4ee282c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
index b6195c3..092ec15 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.hash
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9904690371679e082ff2c23677b6c90e XML-LibXML-2.0128.tar.gz
-sha256 26e7ba451f3bade4d29ff00653a2ee01d13fe38b9a2ebcd0b0f3f82f9f688f2b XML-LibXML-2.0128.tar.gz
+md5    5806b69d54a2d7884b8d22b395888436 XML-LibXML-2.0129.tar.gz
+sha256 5ca0269ba06800c84061a7f3333c85fab5584d69cd7b4e0641963da7fd36b366 XML-LibXML-2.0129.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 69cf57c..8ef6fcb 100644
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
