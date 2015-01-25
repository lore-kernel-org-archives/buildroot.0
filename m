From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:23:07 +0100
Subject: [Buildroot] [git commit] perl-xml-libxml: bump to version 2.0117
Message-ID: <20150125142313.8E11D80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10206b755cbfa8cd03054a5ce19096d87e34df87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-libxml/perl-xml-libxml.hash |    3 +++
 package/perl-xml-libxml/perl-xml-libxml.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/perl-xml-libxml/perl-xml-libxml.hash b/package/perl-xml-libxml/perl-xml-libxml.hash
new file mode 100644
index 0000000..db30300
--- /dev/null
+++ b/package/perl-xml-libxml/perl-xml-libxml.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    484308164ecab1d7d0eddf4dc4c9c0ca XML-LibXML-2.0117.tar.gz
+sha256 5767c90f34ffd3762d7800a64c7190a2635c941a41a73e1156fa791b0652bac0 XML-LibXML-2.0117.tar.gz
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 411beb2..94681e5 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_LIBXML_VERSION = 2.0116
+PERL_XML_LIBXML_VERSION = 2.0117
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
