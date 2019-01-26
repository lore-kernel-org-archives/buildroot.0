From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 26 Jan 2019 09:04:38 +0100
Subject: [Buildroot] [PATCH 5/8] perl-net-dns: bump to version 1.19
In-Reply-To: <20190126080441.10769-1-francois.perrad@gadz.org>
References: <20190126080441.10769-1-francois.perrad@gadz.org>
Message-ID: <20190126080441.10769-5-francois.perrad@gadz.org>
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
index 7a2bba564..2a30ea7ba 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    67af7e5c1c339f60c45c1054374bd8ee Net-DNS-1.18.tar.gz
-sha256 52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3 Net-DNS-1.18.tar.gz
+md5    8a40402888487b853f861d21433f341a Net-DNS-1.19.tar.gz
+sha256 206278bdd9a538bec3e45b50e80cc5a9d7dc6e70ebf0889ef78254f0f710ccd7 Net-DNS-1.19.tar.gz
 
 # computed by scancpan
 sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 4e00b2f89..31db330b1 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.18
+PERL_NET_DNS_VERSION = 1.19
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.17.1
