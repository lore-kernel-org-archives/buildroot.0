From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:53 +0200
Subject: [Buildroot] [git commit] perl-xml-sax: bump to version 1.00
Message-ID: <20180616122909.8CE567FCD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1a2bbf267bb0a71833834b228f8456fcb7c3e53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-xml-sax/perl-xml-sax.hash | 7 +++++--
 package/perl-xml-sax/perl-xml-sax.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-sax/perl-xml-sax.hash b/package/perl-xml-sax/perl-xml-sax.hash
index 6aa543c002..888e9d2b5d 100644
--- a/package/perl-xml-sax/perl-xml-sax.hash
+++ b/package/perl-xml-sax/perl-xml-sax.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    290f5375ae87fdebfdb5bc3854019f24 XML-SAX-0.99.tar.gz
-sha256 32b04b8e36b6cc4cfc486de2d859d87af5386dd930f2383c49347050d6f5ad84 XML-SAX-0.99.tar.gz
+md5    861a454f7bf269990ed2c1c125f4db48 XML-SAX-1.00.tar.gz
+sha256 45ea6564ef8692155d57b2de0862b6442d3c7e29f4a9bc9ede5d7ecdc74c2ae3 XML-SAX-1.00.tar.gz
+
+# computed by scancpan
+sha256 bf2fb225e77b46b8892ef2a8aa5efa92d65b176a870f42559d8b73b308a36509 LICENSE
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index 90b2cd6940..024ac6211e 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_SAX_VERSION = 0.99
+PERL_XML_SAX_VERSION = 1.00
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_DEPENDENCIES = perl-xml-namespacesupport perl-xml-sax-base
