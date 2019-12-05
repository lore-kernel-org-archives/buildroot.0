From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:18:05 +0100
Subject: [Buildroot] [git commit] package/perl-http-entity-parser: bump to
 version 0.22
Message-ID: <20191205221012.9AA7680136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62104f6f951c707c2da57cf1b4c9ee2e7eb3dfc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-entity-parser/perl-http-entity-parser.hash | 4 ++--
 package/perl-http-entity-parser/perl-http-entity-parser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.hash b/package/perl-http-entity-parser/perl-http-entity-parser.hash
index cb6657413a..6e0dccba93 100644
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
index 6d814b2f53..1638d5b1db 100644
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
