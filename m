From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Sep 2019 20:16:23 +0200
Subject: [Buildroot] [PATCH 6/7] package/perl-net-dns: bump to version 0.56
In-Reply-To: <20190917181624.29378-1-francois.perrad@gadz.org>
References: <20190917181624.29378-1-francois.perrad@gadz.org>
Message-ID: <20190917181624.29378-6-francois.perrad@gadz.org>
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
index 9ba2ae85c..e015b872d 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    565d3ae163591f3da7e1a20827b73c28 Net-DNS-1.20.tar.gz
-sha256 7fd9692b687253baa8f2eb639f1dd7ff9c77fddd67167dc59b400bd25e4ce01b Net-DNS-1.20.tar.gz
+md5    91e8593eb6eed41995e6edc567fb6fec Net-DNS-1.21.tar.gz
+sha256 ddefe13b28084ffcc8f10a96b3c13c59449dbf6fc371c006d129630ea0ce767a Net-DNS-1.21.tar.gz
 
 # computed by scancpan
 sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 4091dce9c..a4424c113 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.20
+PERL_NET_DNS_VERSION = 1.21
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.20.1
