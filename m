From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:21:29 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: bump to version 1.70
Message-ID: <20150726162155.A603F7FC1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c8a4d0f59ffd20f1c9419c6bd6702a980b6f6e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-ssleay/perl-net-ssleay.hash |    4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 4a6bcaa..ca659c7 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    2db2445eb072b6ecf8a1a79c9ed3e4de Net-SSLeay-1.68.tar.gz
-sha256 1701e24ec683529cb114e7b7877632f2e965a81381a70b696ee0692ee1e75cd4 Net-SSLeay-1.68.tar.gz
+md5    511cc451a64b0c5051bd9167f37051a0 Net-SSLeay-1.70.tar.gz
+sha256 05eaaa29b8f67778040eee53150ba702fc0ce49420ddd0f1ca68d082f4ee9f4a Net-SSLeay-1.70.tar.gz
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 0ee9566..8a40a29 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.68
+PERL_NET_SSLEAY_VERSION = 1.70
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
