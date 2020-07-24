From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:22 +0200
Subject: [Buildroot] [PATCH 04/10] package/perl-http-entity-parser: bump to
 version 0.23
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-http-entity-parser/perl-http-entity-parser.hash    | 6 +++---
 package/perl-http-entity-parser/perl-http-entity-parser.mk  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.hash b/package/perl-http-entity-parser/perl-http-entity-parser.hash
index 6e0dccba9..700aa86b9 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.hash
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    d8256c95119a3ddc6f4a88e59b67f0ec HTTP-Entity-Parser-0.22.tar.gz
-sha256 93fe1cf2a2b4e6834bf0c1abd0d3bf28c614e8582ff10e6e0426f46a81eed6c8 HTTP-Entity-Parser-0.22.tar.gz
+md5  c03e68f03c55c360a3030c458c46d9dd  HTTP-Entity-Parser-0.23.tar.gz
+sha256  15e671914ebd865d5396802ef2100a9db2218372983a63f4761c897c73e3c46f  HTTP-Entity-Parser-0.23.tar.gz
 
 # computed by scancpan
-sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
+sha256  79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805  LICENSE
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 1638d5b1d..1712b3cbc 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_ENTITY_PARSER_VERSION = 0.22
+PERL_HTTP_ENTITY_PARSER_VERSION = 0.23
 PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
 PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.25.1
