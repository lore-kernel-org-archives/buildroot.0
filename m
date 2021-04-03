From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:53:53 +0200
Subject: [Buildroot] [git commit] package/perl-net-dns: bump version to 1.30
Message-ID: <20210403132859.DE15A806AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e5d7b9b86e60def0f425e846762a574f773b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index da09e91b02..6eb9e2e096 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2c9120830a68f18deb43a95826ea6372  Net-DNS-1.29.tar.gz
-sha256  852d6ee87e8f0d014223026581cbb56924ba8cddd3ceb29c6191dbb6122d43c5  Net-DNS-1.29.tar.gz
+md5  2d0751f5f1a92e4cc95835cd4b9a1d8e  Net-DNS-1.30.tar.gz
+sha256  055e70b67255615724d91ec41788f75af317561c519971f6e6e384273b30a5da  Net-DNS-1.30.tar.gz
 
 # computed by scancpan
 sha256  e4f3224d86bd79ac3d11ea513fcb83c68c20701346653699225331e2b7a2d447  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f5e8328a1e..fc24499239 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.29
+PERL_NET_DNS_VERSION = 1.30
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
