From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:31:28 +0100
Subject: [Buildroot] [git commit] perl-netaddr-ip: bump to version 4.079
Message-ID: <20170120194046.82BB280DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8b468d4afe01a64782725ffb9e0442bc097ff6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-netaddr-ip/perl-netaddr-ip.hash | 4 ++--
 package/perl-netaddr-ip/perl-netaddr-ip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.hash b/package/perl-netaddr-ip/perl-netaddr-ip.hash
index 19bba20..fde62b1 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.hash
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    bca8406520b6535a3f9661d385705d97 NetAddr-IP-4.078.tar.gz
-sha256 b9a12294e58dcece0189630ddb6926e37169cbbb24c76091f1e604e426c19614 NetAddr-IP-4.078.tar.gz
+md5    990dfcbffae356835c536e8ab56a2880 NetAddr-IP-4.079.tar.gz
+sha256 ec5a82dfb7028bcd28bb3d569f95d87dd4166cc19867f2184ed3a59f6d6ca0e7 NetAddr-IP-4.079.tar.gz
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index f2eec6c..b5ee9a1 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NETADDR_IP_VERSION = 4.078
+PERL_NETADDR_IP_VERSION = 4.079
 PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
