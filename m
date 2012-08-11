From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:32 -0300
Subject: [Buildroot] [PATCH 7/8] ethtool: bump to version 3.5
In-Reply-To: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344724053-10165-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
