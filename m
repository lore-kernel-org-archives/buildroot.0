From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Apr 2020 16:18:37 +0200
Subject: [Buildroot] [PATCH 6/8] package/perl-net-dns: bump to version 1.23
In-Reply-To: <20200424141839.1594-1-francois.perrad@gadz.org>
References: <20200424141839.1594-1-francois.perrad@gadz.org>
Message-ID: <20200424141839.1594-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-dns/perl-net-dns.hash | 6 +++---
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 8ef5d5c7d..1c79646a0 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f9b4f0b2613398d27434d94b456583ef Net-DNS-1.22.tar.gz
-sha256 03cd6a733e1cab6f817b4c4dcb7b29575002f8c543fb85e94c6290bc224d4c12 Net-DNS-1.22.tar.gz
+md5  105517139b39650f78c21b2e461ac97e  Net-DNS-1.23.tar.gz
+sha256  cf327f31063b96cd3421be43a1d6cb41eaa61d0595450032e57905b1bd6b2c3e  Net-DNS-1.23.tar.gz
 
 # computed by scancpan
-sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
+sha256  afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 24a0eb339..b0feef4e1 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.22
+PERL_NET_DNS_VERSION = 1.23
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.20.1
