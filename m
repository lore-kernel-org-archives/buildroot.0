From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:41:06 +0200
Subject: [Buildroot] [git commit branch/next] perl-xml-sax-base: bump to
	version 1.09
Message-ID: <20170821214003.55906821FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ded88b9cdbb615117ff3a1d3b592c70367e8762
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-xml-sax-base/perl-xml-sax-base.hash | 4 ++--
 package/perl-xml-sax-base/perl-xml-sax-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.hash b/package/perl-xml-sax-base/perl-xml-sax-base.hash
index 6822e18..a51e1d1 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.hash
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    38c8c3247dfd080712596118d70dbe32 XML-SAX-Base-1.08.tar.gz
-sha256 666270318b15f88b8427e585198abbc19bc2e6ccb36dc4c0a4f2d9807330219e XML-SAX-Base-1.08.tar.gz
+md5    ec347a14065dd7aec7d9fb181b2d7946 XML-SAX-Base-1.09.tar.gz
+sha256 66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0 XML-SAX-Base-1.09.tar.gz
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index bb197ae..ec6e052 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_XML_SAX_BASE_VERSION = 1.08
+PERL_XML_SAX_BASE_VERSION = 1.09
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPL-1.0+
