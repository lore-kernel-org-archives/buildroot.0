From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:15:48 +0200
Subject: [Buildroot] [git commit] libxml-parser-perl: add explicit
	dependencies for host variant
Message-ID: <20160703071558.387DE81E66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53259f9347a824f496fd07a81965c765ab817017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 5c2ac54..9e5325c 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -7,7 +7,7 @@
 LIBXML_PARSER_PERL_VERSION = 2.41
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-LIBXML_PARSER_PERL_DEPENDENCIES = expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPLv1+
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
