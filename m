From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  2 Dec 2016 08:56:59 +0100
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: bump version to 2.44
Message-ID: <20161202075659.19245-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libxml-parser-perl/libxml-parser-perl.hash | 2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index 4a8c0d3..d8e0df5 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740894de9 XML-Parser-2.41.tar.gz
+sha256 1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216 XML-Parser-2.44.tar.gz
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 9e5325c..e512815 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML_PARSER_PERL_VERSION = 2.41
+LIBXML_PARSER_PERL_VERSION = 2.44
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
-- 
2.10.2
