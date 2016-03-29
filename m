From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Tue, 29 Mar 2016 17:41:17 +0530
Subject: [Buildroot] [PATCH] ipmitool: Bump ipmitool to 1.8.16
Message-ID: <20160329121115.3939.74013.stgit@hegdevasant.in.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New release fixes a number of bugs on AMI BMC firmware.

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 package/ipmitool/ipmitool.hash |    2 +-
 package/ipmitool/ipmitool.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index 60189c0..9bb852c 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  4acd2df5f8740fef5c032cebee0113ec4d3bbef04a6f4dbfaf7fcc7f3eb08c40  ipmitool-1.8.15.tar.bz2
+sha256  3c5da6b067abf475bc24685120ec79f6e4ef6b3ea606aaa267e462023861223e  ipmitool-1.8.16.tar.bz2
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 3ace5a7..348d43e 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1.8.15
+IPMITOOL_VERSION = 1.8.16
 IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3c
