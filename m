From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:07:56 +0200
Subject: [Buildroot] [git commit] package/perl-sub-quote: bump to version
 2.006003
Message-ID: <20190401200604.A031E8B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d2ceb7448a0fe18113b86134b988060a5034ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the README changed for reasons unrelated to licensing: a
new "ENVIRONMENT" section was added to the README.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: re-add license file, explain in the commit log why its hash
changed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-sub-quote/perl-sub-quote.hash | 8 +++-----
 package/perl-sub-quote/perl-sub-quote.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index 8af5e2c07d..acf4741404 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,6 +1,4 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1b0f288ca8c60243f9bc29cfee4c4986 Sub-Quote-2.005001.tar.gz
-sha256 d6ab4f0775def015367a05e02024b403f991b2be11d774f3d235fe7e9bdbba07 Sub-Quote-2.005001.tar.gz
-
-# computed by scancpan
-sha256 8f7a1d60c718174b7752562007b2643d4a1c23f901cbeb7774015805efe0a817 README
+md5    ca8ed234f10b822d18b1bfb9734797a7 Sub-Quote-2.006003.tar.gz
+sha256 be1f3a6f773f351f203cdc8f614803ac492b77d15fd68d5b1f0cd3884be18176 Sub-Quote-2.006003.tar.gz
+sha256 de2ee5cbd65702755c9d0351cc2aa1850a25ae64fdbc6da2f01c24cdcb5b1b03 README
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 1e364f2133..7f8d54989a 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.005001
+PERL_SUB_QUOTE_VERSION = 2.006003
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
