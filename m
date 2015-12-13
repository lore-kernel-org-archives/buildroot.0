From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:34:36 +0100
Subject: [Buildroot] [git commit] package/perl-net-dns: bump version to 1.04
Message-ID: <20151213213445.44AA47FC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1477118df3df0e44ec2c7c6db9db9fd833159095
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 6533e2b..bb1fdfa 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    adbb3fd9bc1677d8fd79605925a35106 Net-DNS-1.02.tar.gz
-sha256 9473c322b036592663bb20383e85190a682d142688b162efc975a61bcc7534f2 Net-DNS-1.02.tar.gz
+md5    5a6f6e6811d6bf8eefd84ce778c2bc2e Net-DNS-1.04.tar.gz
+sha256 4b9f220304c5722658fbdbe4db31ab77486b5f0aaada78c9d1b528e4b0680965 Net-DNS-1.04.tar.gz
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 59d2b60..6337612 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.02
+PERL_NET_DNS_VERSION = 1.04
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
