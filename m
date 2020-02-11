From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2020 00:15:05 +0100
Subject: [Buildroot] [git commit] package/libxml-parser-perl: bump to
 version 2.46
Message-ID: <20200211230623.B84F98DE63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436679d954924cbf64fcd09c5d6d5d2c7e3eef95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml-parser-perl/libxml-parser-perl.hash | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index 1e2a1c4665..7aeec70b9e 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216 XML-Parser-2.44.tar.gz
-sha256 a008c782e078102720266824c1e87875bafbf25ffae4b173dc135f9a4e1c672e README
+sha256 d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d XML-Parser-2.46.tar.gz
+sha256 6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2 README
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 514c457d5a..fcde5fc939 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML_PARSER_PERL_VERSION = 2.44
+LIBXML_PARSER_PERL_VERSION = 2.46
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
