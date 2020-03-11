From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:53 +0100
Subject: [Buildroot] [PATCH 07/10] package/perl-net-dns: bump to version 1.22
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-7-francois.perrad@gadz.org>
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
index e015b872d..8ef5d5c7d 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    91e8593eb6eed41995e6edc567fb6fec Net-DNS-1.21.tar.gz
-sha256 ddefe13b28084ffcc8f10a96b3c13c59449dbf6fc371c006d129630ea0ce767a Net-DNS-1.21.tar.gz
+md5    f9b4f0b2613398d27434d94b456583ef Net-DNS-1.22.tar.gz
+sha256 03cd6a733e1cab6f817b4c4dcb7b29575002f8c543fb85e94c6290bc224d4c12 Net-DNS-1.22.tar.gz
 
 # computed by scancpan
 sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index a4424c113..24a0eb339 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.21
+PERL_NET_DNS_VERSION = 1.22
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.20.1
