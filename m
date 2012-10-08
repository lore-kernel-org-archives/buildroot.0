From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Oct 2012 19:01:04 -0300
Subject: [Buildroot] [PATCH 3/4] ethtool: bump to version 3.6
In-Reply-To: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
References: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1349733665-2584-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
