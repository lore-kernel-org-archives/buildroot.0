From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:00:42 +0100
Subject: [Buildroot] [git commit] perl-xml-libxml: bump to version 2.0122
Message-ID: <20151025210816.8785B7FE27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cff199de5e17c1c0c843592e3ff3429a68ce9e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-xml-libxml/perl-xml-libxml.hash |    4 ++--
 package/perl-xml-libxml/perl-xml-libxml.mk   |    2 +-
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
