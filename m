From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 16:12:37 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] libxml-parser-perl: add
	LICENSE_FILES
Message-ID: <20170719204759.BB4C67FF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59045b2bb7b24473aca4dcaa230a975fe054e477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

There is copyright information in the top level README file. Use this
file as the license file which will be included by the `legal-info`
build rule.

Signed-off-by: Ben Leinweber <bleinweber@spaceflight.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 730da52edc45f2b72fc1d522ff184276d20c8b0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 401470d..09a4a7f 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -9,6 +9,7 @@ LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
 LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
+LIBXML_PARSER_PERL_LICENSE_FILES = README
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
