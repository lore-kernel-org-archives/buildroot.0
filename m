From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Jun 2021 19:56:03 +0200
Subject: [Buildroot] [PATCH 5/6] package/perl-net-dns: bump to version 1.31
In-Reply-To: <20210607175604.2850795-1-francois.perrad@gadz.org>
References: <20210607175604.2850795-1-francois.perrad@gadz.org>
Message-ID: <20210607175604.2850795-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 6eb9e2e09..a6236357e 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2d0751f5f1a92e4cc95835cd4b9a1d8e  Net-DNS-1.30.tar.gz
-sha256  055e70b67255615724d91ec41788f75af317561c519971f6e6e384273b30a5da  Net-DNS-1.30.tar.gz
+md5  2a0364cea1ab6c1134506921d909f393  Net-DNS-1.31.tar.gz
+sha256  00024a8e371605c6d8422a27a0a87af8b7cf66f26502102e68ddd4baf7cfc615  Net-DNS-1.31.tar.gz
 
 # computed by scancpan
 sha256  e4f3224d86bd79ac3d11ea513fcb83c68c20701346653699225331e2b7a2d447  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index fc2449923..7be1b822c 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.30
+PERL_NET_DNS_VERSION = 1.31
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.30.2
