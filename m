From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:00:52 +0100
Subject: [Buildroot] [git commit] package/perl-sub-quote: bump to version
 2.006006
Message-ID: <20191028225558.4B7F58C55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba9f451f5e9801a93f866f4fd2096ee1be759226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

license lives now in its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-sub-quote/perl-sub-quote.hash | 8 +++++---
 package/perl-sub-quote/perl-sub-quote.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/perl-sub-quote/perl-sub-quote.hash b/package/perl-sub-quote/perl-sub-quote.hash
index acf4741404..d918af2358 100644
--- a/package/perl-sub-quote/perl-sub-quote.hash
+++ b/package/perl-sub-quote/perl-sub-quote.hash
@@ -1,4 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ca8ed234f10b822d18b1bfb9734797a7 Sub-Quote-2.006003.tar.gz
-sha256 be1f3a6f773f351f203cdc8f614803ac492b77d15fd68d5b1f0cd3884be18176 Sub-Quote-2.006003.tar.gz
-sha256 de2ee5cbd65702755c9d0351cc2aa1850a25ae64fdbc6da2f01c24cdcb5b1b03 README
+md5    1bb9caee697bcfa738f419d40505e506 Sub-Quote-2.006006.tar.gz
+sha256 6e4e2af42388fa6d2609e0e82417de7cc6be47223f576592c656c73c7524d89d Sub-Quote-2.006006.tar.gz
+
+# computed by scancpan
+sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 7f8d54989a..a22da16922 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_SUB_QUOTE_VERSION = 2.006003
+PERL_SUB_QUOTE_VERSION = 2.006006
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
-PERL_SUB_QUOTE_LICENSE_FILES = README
+PERL_SUB_QUOTE_LICENSE_FILES = LICENSE
 PERL_SUB_QUOTE_DISTNAME = Sub-Quote
 
 $(eval $(perl-package))
