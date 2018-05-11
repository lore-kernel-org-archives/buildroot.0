From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:02:51 +0200
Subject: [Buildroot] [git commit branch/next] package/perl-net-dns: bump
 version to 1.15
Message-ID: <20180511200232.6AD078C9E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcae6a8c84f1a83729d4f2fd86dfd22284bb6d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 6 ++++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 1572a9f3c2..44cad68764 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    0da1099c0a3548d36ea9e31d5bb9e122 Net-DNS-1.14.tar.gz
-sha256 83c38a594eeb2c85d66e60047a0f5b403f34bd92a5d13606f02e828d450299fc Net-DNS-1.14.tar.gz
+md5    daaf39133bb89a31c093510169c228e1 Net-DNS-1.15.tar.gz
+sha256 1ad46ba6438b846a94b4f50d53ecfda55f504a17e11b94effb087ff9329e61d0 Net-DNS-1.15.tar.gz
+# Locally computed
+sha256 ab10a05c33f412e00f71a828aa7521288309cfac74b1f075daef8560e86a9b94  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 0066a31ba3..f9d22c240d 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.14
+PERL_NET_DNS_VERSION = 1.15
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
