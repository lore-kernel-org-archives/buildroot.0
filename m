From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:26:53 +0200
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to version 1.27
Message-ID: <20201024201639.C91CA839B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bbe6a98249ab64ade6a0075b992e4cfc1af3757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 2a2212a992..dfedb0a950 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  6db2562b6c42619e9c7d7e62422af8c4  Net-DNS-1.26.tar.gz
-sha256  eabaecd0fdb3e6adef8c9e016e8509319f19caa8c76836253f7db72bafe56498  Net-DNS-1.26.tar.gz
+md5  204e08e5c8042ce0e7d7f0851af46d50  Net-DNS-1.27.tar.gz
+sha256  f336277710f3672095b23efe0735d8093fc493070944c57c4ec39191a52abd41  Net-DNS-1.27.tar.gz
 
 # computed by scancpan
 sha256  afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 1408725f77..3d9ee3a2ff 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.26
+PERL_NET_DNS_VERSION = 1.27
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
