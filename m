From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Jan 2015 17:37:05 +0100
Subject: [Buildroot] [PATCH 5/5] perl-xml-libxml: bump to version 2.0117
In-Reply-To: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
References: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422031025-29533-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-xml-libxml/perl-xml-libxml.hash | 3 +++
 package/perl-xml-libxml/perl-xml-libxml.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/perl-xml-libxml/perl-xml-libxml.hash

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
-- 
2.1.0
