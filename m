From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jul 2019 15:50:28 +0200
Subject: [Buildroot] [git commit] package/perl-xml-sax: bump to version 1.02
Message-ID: <20190721134944.7EFA77FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9e8ebe47fc29895e7017660e88158a0197bb14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-xml-sax/perl-xml-sax.hash | 4 ++--
 package/perl-xml-sax/perl-xml-sax.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-sax/perl-xml-sax.hash b/package/perl-xml-sax/perl-xml-sax.hash
index 888e9d2b5d..df63047f06 100644
--- a/package/perl-xml-sax/perl-xml-sax.hash
+++ b/package/perl-xml-sax/perl-xml-sax.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    861a454f7bf269990ed2c1c125f4db48 XML-SAX-1.00.tar.gz
-sha256 45ea6564ef8692155d57b2de0862b6442d3c7e29f4a9bc9ede5d7ecdc74c2ae3 XML-SAX-1.00.tar.gz
+md5    b62e3754523695c7f5bbcafa3676a38d XML-SAX-1.02.tar.gz
+sha256 4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a XML-SAX-1.02.tar.gz
 
 # computed by scancpan
 sha256 bf2fb225e77b46b8892ef2a8aa5efa92d65b176a870f42559d8b73b308a36509 LICENSE
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index 17518367dc..e8de01bcb1 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_SAX_VERSION = 1.00
+PERL_XML_SAX_VERSION = 1.02
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_LICENSE = Artistic or GPL-1.0+
