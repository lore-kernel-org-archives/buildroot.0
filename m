From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 05:07:18 -0500
Subject: [Buildroot] [PATCH v2 4/8] package/perl-net-snmp: remove 'v' prefix
In-Reply-To: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027100722.64156-4-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v1 -> v2
 - Cleaned up title
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
-- 
2.17.1
