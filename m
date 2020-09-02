From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  2 Sep 2020 17:08:36 +0200
Subject: [Buildroot] [PATCH 5/7] package/perl-net-dns: bump to version 1.26
In-Reply-To: <20200902150838.874797-1-francois.perrad@gadz.org>
References: <20200902150838.874797-1-francois.perrad@gadz.org>
Message-ID: <20200902150838.874797-5-francois.perrad@gadz.org>
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
index d3f909dec..2a2212a99 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  5c0d1a6de317993e146ce6d37c897be5  Net-DNS-1.25.tar.gz
-sha256  10931927d32d771817f9cd7d5502794f245a86cb403310db33656e493f67ff25  Net-DNS-1.25.tar.gz
+md5  6db2562b6c42619e9c7d7e62422af8c4  Net-DNS-1.26.tar.gz
+sha256  eabaecd0fdb3e6adef8c9e016e8509319f19caa8c76836253f7db72bafe56498  Net-DNS-1.26.tar.gz
 
 # computed by scancpan
 sha256  afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index bd387bb08..1408725f7 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.25
+PERL_NET_DNS_VERSION = 1.26
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.25.1
