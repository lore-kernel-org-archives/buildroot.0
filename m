From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:37:21 +0200
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to versionn 1.24
Message-ID: <20200605203650.BCFE980E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73bd4896cff0232c07b2fb6f6cb1ff9dbb7c8089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 1c79646a05..14662a235d 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  105517139b39650f78c21b2e461ac97e  Net-DNS-1.23.tar.gz
-sha256  cf327f31063b96cd3421be43a1d6cb41eaa61d0595450032e57905b1bd6b2c3e  Net-DNS-1.23.tar.gz
+md5  1bf07817bb272d412a737ecc2347d70b  Net-DNS-1.24.tar.gz
+sha256  11a6c2ba6cb1c6640f01c9bbf2036bcbe3974232e9b939ab94985230c92cde63  Net-DNS-1.24.tar.gz
 
 # computed by scancpan
 sha256  afa7d288df3e3edbdb34790407ba4a9c7750c2746059d9355f4168bfb3212583  README
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index b0feef4e1f..a6e0f9a280 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.23
+PERL_NET_DNS_VERSION = 1.24
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
