From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Dec 2012 09:08:21 -0300
Subject: [Buildroot] [PATCH 2/3] ethtool: bump to version 3.7
In-Reply-To: <1355832502-3907-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355832502-3907-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355832502-3907-2-git-send-email-gustavo@zacarias.com.ar>
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
index 8c5961c..11abbc2 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.6
+ETHTOOL_VERSION = 3.7
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
 ETHTOOL_LICENSE_FILES = COPYING
-- 
1.7.8.6
