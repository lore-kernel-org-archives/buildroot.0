From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:38 -0000
Subject: [Buildroot] [git commit] ethtool: bump to version 3.5
Message-ID: <20120903200536.6E55F9953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3a698de727b9747f4fd4b1495426b7fe4918af3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ethtool/ethtool.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 63a8d54..30d0a47 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,9 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.4.1
+ETHTOOL_VERSION = 3.5
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
+ETHTOOL_LICENSE = GPLv2
+ETHTOOL_LICENSE_FILE = COPYING
 
 $(eval $(autotools-package))
