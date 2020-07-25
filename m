From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:34:33 +0200
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to version 1.25
Message-ID: <20200725213109.207E08144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cbbfccbf7fed62258027d05b81c8e25bf0a3e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 14662a235d..d3f909dec1 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1bf07817bb272d412a737ecc2347d70b  Net-DNS-1.24.tar.gz
-sha256  11a6c2ba6cb1c6640f01c9bbf2036bcbe3974232e9b939ab94985230c92cde63  Net-DNS-1.24.tar.gz
+md5  5c0d1a6de317993e146ce6d37c897be5  Net-DNS-1.25.tar.gz
+sha256  10931927d32d771817f9cd7d5502794f245a86cb403310db33656e493f67ff25  Net-DNS-1.25.tar.gz
 
 # computed by scancpan
 sha256  afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index a6e0f9a280..bd387bb081 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.24
+PERL_NET_DNS_VERSION = 1.25
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
