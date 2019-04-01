From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:01:11 +0200
Subject: [Buildroot] [git commit] package/perl-net-ping: bump to version 2.72
Message-ID: <20190401200604.909477F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd24e6ffecbce808eadd10cbc33b48d9b548a95c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ping/perl-net-ping.hash | 4 ++--
 package/perl-net-ping/perl-net-ping.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ping/perl-net-ping.hash b/package/perl-net-ping/perl-net-ping.hash
index c3bff0339d..2842827c85 100644
--- a/package/perl-net-ping/perl-net-ping.hash
+++ b/package/perl-net-ping/perl-net-ping.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    58110451d15d27b46ebc6a53f1697ff1 Net-Ping-2.71.tar.gz
-sha256 0819d0aa87b173e98ecb3ccfd92272ce53c7fc9e86f962f64602a6fa477f7d4f Net-Ping-2.71.tar.gz
+md5    eb90f86dcc31126e88be02ecb62d5303 Net-Ping-2.72.tar.gz
+sha256 555af602f54229cd81fef7da1a81516800f3155c6dc4d07dc71be1de3253dd6a Net-Ping-2.72.tar.gz
 
 # computed by scancpan
 sha256 9441a22309a2b40ff1282ac1906c137f07f5e521e7b1ec162b251f6006051b47 README
diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
index 5e8f53be1e..b422c4eaba 100644
--- a/package/perl-net-ping/perl-net-ping.mk
+++ b/package/perl-net-ping/perl-net-ping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_PING_VERSION = 2.71
+PERL_NET_PING_VERSION = 2.72
 PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
 PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_NET_PING_LICENSE = Artistic or GPL-1.0+
