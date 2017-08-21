From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:58 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: bump to version 1.81
Message-ID: <20170902130619.10FAD81D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74546b819f850f642bcd9dd33dccab1d408480a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 4 ++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 556aea7..08b2aee 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a740d7792dbac8ca8c4eb38d3b8fbd01 Net-SSLeay-1.72.tar.gz
-sha256 1baac39f0f12cee515d8bec633175bb5916ca542e5356e26420437bd6195d2f4 Net-SSLeay-1.72.tar.gz
+md5    71932ce34d4db44de8d00399c3405792 Net-SSLeay-1.81.tar.gz
+sha256 00cbb6174e628b42178e1445c9fd5a3c5ae2cfd6a5a43e03610ba14786f21b7d Net-SSLeay-1.81.tar.gz
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 03a039e..e91b344 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.72
+PERL_NET_SSLEAY_VERSION = 1.81
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
