From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:29 +0200
Subject: [Buildroot] [PATCH 16/18] perl-xml-namespacesupport: bump to
	version 1.12
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-16-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-xml-namespacesupport/Config.in                      | 4 ++--
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash | 4 ++--
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-xml-namespacesupport/Config.in b/package/perl-xml-namespacesupport/Config.in
index bc67d4790..93a697c62 100644
--- a/package/perl-xml-namespacesupport/Config.in
+++ b/package/perl-xml-namespacesupport/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
 	bool "perl-xml-namespacesupport"
 	help
-	  a simple generic namespace support class
+	  A simple generic namespace processor
 
-	  https://metacpan.org/release/XML-NamespaceSupport
+	  https://github.com/perigrin/xml-namespacesupport
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
index 9389601d0..d55551c11 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    222cca76161cd956d724286d36b607da XML-NamespaceSupport-1.11.tar.gz
-sha256 6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda287b74ea XML-NamespaceSupport-1.11.tar.gz
+md5    a8916c6d095bcf073e1108af02e78c97 XML-NamespaceSupport-1.12.tar.gz
+sha256 47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef XML-NamespaceSupport-1.12.tar.gz
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index d7bcdd455..325440b33 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
+PERL_XML_NAMESPACESUPPORT_VERSION = 1.12
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPL-1.0+
-PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = README
+PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
-- 
2.11.0
