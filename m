From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:35 +0100
Subject: [Buildroot] [git commit] perl-gd: bump to version 2.67
Message-ID: <20180117213712.804CF83F1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe02162326c0e67d3a9d9e49afc89849edd0970a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-gd/perl-gd.hash | 4 ++--
 package/perl-gd/perl-gd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 3fc0628..ad30e0a 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5c89ea8861810ca41bc4aca98e3fdfda GD-2.66.tar.gz
-sha256 ea28343301b82ea862bc58c0c2d1953a074e23cf8d1d09df94c05c52f1c98281 GD-2.66.tar.gz
+md5    b9cfc5a677b5e9fa607be1379f789855 GD-2.67.tar.gz
+sha256 93a47c2259979cf20c6a39c9e03e0da87a9a855d8b650fb68a08d16a96684246 GD-2.67.tar.gz
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index ae3dfbc..81070a9 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.66
+PERL_GD_VERSION = 2.67
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
