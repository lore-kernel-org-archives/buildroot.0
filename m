From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:00:23 +0200
Subject: [Buildroot] [git commit] perl-gdgraph: bump to version 1.59
Message-ID: <20150418133112.F1EDE7FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=333fe638326ccf1c4c6f5740e904447ea2e14922
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-gdgraph/perl-gdgraph.hash |    4 ++--
 package/perl-gdgraph/perl-gdgraph.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index ba51793..7005cc9 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    2c9e4feb4246200d96b9faa8024b0bf0 GDGraph-1.48.tar.gz
-sha256 4324a104557edaf8925a20f24326af89c08e419989fbaa7380f0c9731bc2ac6c GDGraph-1.48.tar.gz
+md5    8bb270a30fea27491302b39b701b3d4e GDGraph-1.49.tar.gz
+sha256 d26538c827e35c1d4b27f3c045b60f1ab6b45401c54a87e86103cd7c2374cff5 GDGraph-1.49.tar.gz
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 421fe99..dfb08d1 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GDGRAPH_VERSION = 1.48
+PERL_GDGRAPH_VERSION = 1.49
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
 PERL_GDGRAPH_DEPENDENCIES = perl perl-gd perl-gdtextutil
