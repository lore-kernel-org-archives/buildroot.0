From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 24 Jan 2017 09:25:34 +0100
Subject: [Buildroot] [V2 3/3] perl-gdgraph: bump to version 1.54
In-Reply-To: <20170124082534.21033-1-francois.perrad@gadz.org>
References: <20170124082534.21033-1-francois.perrad@gadz.org>
Message-ID: <20170124082534.21033-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gdgraph/perl-gdgraph.hash | 4 ++--
 package/perl-gdgraph/perl-gdgraph.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index 7005cc9..2e85452 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8bb270a30fea27491302b39b701b3d4e GDGraph-1.49.tar.gz
-sha256 d26538c827e35c1d4b27f3c045b60f1ab6b45401c54a87e86103cd7c2374cff5 GDGraph-1.49.tar.gz
+md5    38c6a188519e6272e9b2b722b315c3d8 GDGraph-1.54.tar.gz
+sha256 b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f GDGraph-1.54.tar.gz
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index dbc789e..dc7ffd9 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GDGRAPH_VERSION = 1.49
+PERL_GDGRAPH_VERSION = 1.54
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
 PERL_GDGRAPH_DEPENDENCIES = perl-gd perl-gdtextutil
-- 
2.9.3
