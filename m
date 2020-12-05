From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:51 +0100
Subject: [Buildroot] [PATCH 04/10] package/perl-http-entity-parser: bump to
 version 0.25
In-Reply-To: <20201205064457.606737-1-francois.perrad@gadz.org>
References: <20201205064457.606737-1-francois.perrad@gadz.org>
Message-ID: <20201205064457.606737-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-entity-parser/perl-http-entity-parser.hash | 4 ++--
 package/perl-http-entity-parser/perl-http-entity-parser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.hash b/package/perl-http-entity-parser/perl-http-entity-parser.hash
index 882bf0a3d..69d5f6e97 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.hash
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  b5ead58775c2f151f2174651807fdf2d  HTTP-Entity-Parser-0.24.tar.gz
-sha256  f68e0fc87150cb9241ac23d7226fc2a35324d2e8990830c1e2a7203244f1e612  HTTP-Entity-Parser-0.24.tar.gz
+md5  09663f9577975587e832e28ba5f5f8af  HTTP-Entity-Parser-0.25.tar.gz
+sha256  3a8cd0d8cba3d17cd8c04ee82d7341dfaa247dbdd94a49eb94b53f69e483ec3a  HTTP-Entity-Parser-0.25.tar.gz
 
 # computed by scancpan
 sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 0b09ea41c..2304955bd 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_ENTITY_PARSER_VERSION = 0.24
+PERL_HTTP_ENTITY_PARSER_VERSION = 0.25
 PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
 PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.27.0
