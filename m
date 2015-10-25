From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:56:41 +0100
Subject: [Buildroot] [git commit] perl-netaddr-ip: bump to version 4.078
Message-ID: <20151025210816.54485818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fff978be292b859525247e87eab17297cb74f316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-netaddr-ip/Config.in            |    2 +-
 package/perl-netaddr-ip/perl-netaddr-ip.hash |    4 ++--
 package/perl-netaddr-ip/perl-netaddr-ip.mk   |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-netaddr-ip/Config.in b/package/perl-netaddr-ip/Config.in
index 4f082f1..7ccb20a 100644
--- a/package/perl-netaddr-ip/Config.in
+++ b/package/perl-netaddr-ip/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PERL_NETADDR_IP
 	bool "perl-netaddr-ip"
 	depends on !BR2_STATIC_LIBS
 	help
-	  NetAddr::IP - Manages IPv4 and IPv6 addresses and subnets
+	  Manages IPv4 and IPv6 addresses and subnets
 
 	  https://metacpan.org/release/NetAddr-IP
 
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.hash b/package/perl-netaddr-ip/perl-netaddr-ip.hash
index 37d17fa..19bba20 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.hash
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b72b91ebd228b096fd3b0acc87df877e NetAddr-IP-4.075.tar.gz
-sha256 ab8275bb8f306f780cd029a6dc48764461f4d1ef3a106b99fe5a90cbf2968839 NetAddr-IP-4.075.tar.gz
+md5    bca8406520b6535a3f9661d385705d97 NetAddr-IP-4.078.tar.gz
+sha256 b9a12294e58dcece0189630ddb6926e37169cbbb24c76091f1e604e426c19614 NetAddr-IP-4.078.tar.gz
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index 8acb4d7..2e5a82a 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NETADDR_IP_VERSION = 4.075
+PERL_NETADDR_IP_VERSION = 4.078
 PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
