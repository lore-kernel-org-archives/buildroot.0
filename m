From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:31:08 +0100
Subject: [Buildroot] [git commit] perl-net-dns: bump to version 1.07
Message-ID: <20170120194046.7752E80DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e635642eee758af81283ae99d0d48fb71624376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: keep existing homepage URL]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-net-dns/Config.in         | 2 +-
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index 24ce481..de720bf 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_PERL_NET_DNS
 	bool "perl-net-dns"
 	select BR2_PACKAGE_PERL_DIGEST_HMAC
 	help
-	  Net::DNS is a DNS resolver implemented in Perl.
+	  Perl Interface to the Domain Name System
 
 	  http://www.net-dns.org
diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index bb1fdfa..d2f0725 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5a6f6e6811d6bf8eefd84ce778c2bc2e Net-DNS-1.04.tar.gz
-sha256 4b9f220304c5722658fbdbe4db31ab77486b5f0aaada78c9d1b528e4b0680965 Net-DNS-1.04.tar.gz
+md5    96c1a801cab92b81696a037c7c326e59 Net-DNS-1.07.tar.gz
+sha256 5f91497f1af9f690153fa05a27a7d73ddada08bed40536fe2d0ac759b7af8492 Net-DNS-1.07.tar.gz
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 6337612..f1a0b88 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.04
+PERL_NET_DNS_VERSION = 1.07
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
