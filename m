From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:55 +0200
Subject: [Buildroot] [git commit branch/next] perl-net-dns: bump to version
	1.12
Message-ID: <20170821214003.3A0C37FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39a3354bb1419e91e770dda441db68358102292b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-dns/Config.in         | 2 +-
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index de720bf..c156505 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PERL_NET_DNS
 	help
 	  Perl Interface to the Domain Name System
 
-	  http://www.net-dns.org
+	  https://metacpan.org/release/Net-DNS
diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index d2f0725..a7234b2 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    96c1a801cab92b81696a037c7c326e59 Net-DNS-1.07.tar.gz
-sha256 5f91497f1af9f690153fa05a27a7d73ddada08bed40536fe2d0ac759b7af8492 Net-DNS-1.07.tar.gz
+md5    7e7c6cf8184df4d49500a003d998764a Net-DNS-1.12.tar.gz
+sha256 25ff01fe79de3fb759d190fadb0971c326f4afc2e6a4541d10d624f65b34c1ff Net-DNS-1.12.tar.gz
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f1a0b88..2aad6bd 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.07
+PERL_NET_DNS_VERSION = 1.12
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
