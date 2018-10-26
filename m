From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:20:15 +0200
Subject: [Buildroot] [git commit] perl-net-dns: bump to version 1.18
Message-ID: <20181026191920.187308908F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27d462b9c28c4cfbffc214add603c9ec64133baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash is updated, but due to changes to the README
file that do not affect the licensing terms.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 9 +++++----
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 44cad68764..7a2bba5640 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    daaf39133bb89a31c093510169c228e1 Net-DNS-1.15.tar.gz
-sha256 1ad46ba6438b846a94b4f50d53ecfda55f504a17e11b94effb087ff9329e61d0 Net-DNS-1.15.tar.gz
-# Locally computed
-sha256 ab10a05c33f412e00f71a828aa7521288309cfac74b1f075daef8560e86a9b94  README
+md5    67af7e5c1c339f60c45c1054374bd8ee Net-DNS-1.18.tar.gz
+sha256 52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3 Net-DNS-1.18.tar.gz
+
+# computed by scancpan
+sha256 afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583 README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 50c7293b56..4e00b2f89b 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.15
+PERL_NET_DNS_VERSION = 1.18
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
