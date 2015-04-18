From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:00:31 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: bump to version 1.68
Message-ID: <20150418133113.71B1D7FA59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3aac32799ebc1cd07d201022f9eb7f07651e40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-ssleay/perl-net-ssleay.hash |    4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 569f3e4..4a6bcaa 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1e15d2287ce13e377c26240190da2a86 Net-SSLeay-1.67.tar.gz
-sha256 1876466e7a6373649299df4a2d094060e1bda074450b107545caf3e352c37e4e Net-SSLeay-1.67.tar.gz
+md5    2db2445eb072b6ecf8a1a79c9ed3e4de Net-SSLeay-1.68.tar.gz
+sha256 1701e24ec683529cb114e7b7877632f2e965a81381a70b696ee0692ee1e75cd4 Net-SSLeay-1.68.tar.gz
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index b850a5e..0ee9566 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.67
+PERL_NET_SSLEAY_VERSION = 1.68
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
