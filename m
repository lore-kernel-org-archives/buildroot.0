From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:01:11 +0200
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to version 1.20
Message-ID: <20190401200604.889398B7C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3caf3c99ba3c07b3bdb0530a8474c8503721797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 2a30ea7ba5..9ba2ae85cf 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    8a40402888487b853f861d21433f341a Net-DNS-1.19.tar.gz
-sha256 206278bdd9a538bec3e45b50e80cc5a9d7dc6e70ebf0889ef78254f0f710ccd7 Net-DNS-1.19.tar.gz
+md5    565d3ae163591f3da7e1a20827b73c28 Net-DNS-1.20.tar.gz
+sha256 7fd9692b687253baa8f2eb639f1dd7ff9c77fddd67167dc59b400bd25e4ce01b Net-DNS-1.20.tar.gz
 
 # computed by scancpan
 sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 31db330b1f..4091dce9cb 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.19
+PERL_NET_DNS_VERSION = 1.20
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
