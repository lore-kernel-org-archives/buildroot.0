From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 14:43:25 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 3.6
Message-ID: <20121009124425.2C6C7997DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=902b1ddd151aa64637c80f120f4db5af0ee3fc0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 30d0a47..a336b52 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.5
+ETHTOOL_VERSION = 3.6
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
 ETHTOOL_LICENSE_FILE = COPYING
