From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:46 +0100
Subject: [Buildroot] [PATCH 4/8] package/perl-http-entity-parser: bump to
 version 0.22
In-Reply-To: <20191204083351.6134-1-francois.perrad@gadz.org>
References: <20191204083351.6134-1-francois.perrad@gadz.org>
Message-ID: <20191204083351.6134-4-francois.perrad@gadz.org>
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
index cb6657413..6e0dccba9 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.hash
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    50e8418bfe27ab26818ca6e264052c95 HTTP-Entity-Parser-0.21.tar.gz
-sha256 c14d3e42bdb0845eb412640ca5e396cbd52d3a9a616a5974a32a52cab487f8d8 HTTP-Entity-Parser-0.21.tar.gz
+md5    d8256c95119a3ddc6f4a88e59b67f0ec HTTP-Entity-Parser-0.22.tar.gz
+sha256 93fe1cf2a2b4e6834bf0c1abd0d3bf28c614e8582ff10e6e0426f46a81eed6c8 HTTP-Entity-Parser-0.22.tar.gz
 
 # computed by scancpan
 sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 6d814b2f5..1638d5b1d 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_ENTITY_PARSER_VERSION = 0.21
+PERL_HTTP_ENTITY_PARSER_VERSION = 0.22
 PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
 PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
 PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.20.1
