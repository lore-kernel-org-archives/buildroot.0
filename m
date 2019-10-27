From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:48:55 +0100
Subject: [Buildroot] [git commit] package/perl-net-snmp: remove 'v' prefix
Message-ID: <20191027104238.B648188F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=649f8080c05f99fc19cc08a45ac418260491d5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-snmp/perl-net-snmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
index ae8607e406..36b50d6358 100644
--- a/package/perl-net-snmp/perl-net-snmp.mk
+++ b/package/perl-net-snmp/perl-net-snmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERL_NET_SNMP_VERSION = v6.0.1
-PERL_NET_SNMP_SOURCE = Net-SNMP-$(PERL_NET_SNMP_VERSION).tar.gz
+PERL_NET_SNMP_VERSION = 6.0.1
+PERL_NET_SNMP_SOURCE = Net-SNMP-v$(PERL_NET_SNMP_VERSION).tar.gz
 PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
 PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
 PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
