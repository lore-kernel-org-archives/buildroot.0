From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:41:05 +0200
Subject: [Buildroot] [git commit] perl-xml-namespacesupport: bump to version
	1.12
Message-ID: <20170902130619.54A9F81D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=731a0316a6e4172d24c5eefc8897cdfefc89a5c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-namespacesupport/Config.in                      | 4 ++--
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash | 4 ++--
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-xml-namespacesupport/Config.in b/package/perl-xml-namespacesupport/Config.in
index bc67d47..93a697c 100644
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
index 9389601..d55551c 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    222cca76161cd956d724286d36b607da XML-NamespaceSupport-1.11.tar.gz
-sha256 6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda287b74ea XML-NamespaceSupport-1.11.tar.gz
+md5    a8916c6d095bcf073e1108af02e78c97 XML-NamespaceSupport-1.12.tar.gz
+sha256 47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef XML-NamespaceSupport-1.12.tar.gz
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index d7bcdd4..325440b 100644
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
