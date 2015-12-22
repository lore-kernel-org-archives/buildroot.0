From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 09:17:05 +0100
Subject: [Buildroot] [git commit] ipmitool: Bump ipmitool to 1.8.15
Message-ID: <20151222081721.20C5882532@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d290476545de576a0cec17a3d40a6a9e90fe5666
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New release fixes a number of bugs, including some needed for talking
to modern AMI BMC firmware as shipped on some POWER8 systems.

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipmitool/ipmitool.hash | 2 +-
 package/ipmitool/ipmitool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index 04b3542..60189c0 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  3209c99b996fdea38c462cfd10387d6895fd5261227ab6f79b59f88e21938ce5  ipmitool-1.8.14.tar.bz2
+sha256  4acd2df5f8740fef5c032cebee0113ec4d3bbef04a6f4dbfaf7fcc7f3eb08c40  ipmitool-1.8.15.tar.bz2
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 137987f..3ace5a7 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1.8.14
+IPMITOOL_VERSION = 1.8.15
 IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3c
