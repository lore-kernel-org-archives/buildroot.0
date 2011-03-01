From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:18:10 -0300
Subject: [Buildroot] [PATCH 2/3] ethtool: bump to version 2.6.36
In-Reply-To: <1298996291-676-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996291-676-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996291-676-2-git-send-email-gustavo@zacarias.com.ar>
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
index 1fc2315..b0dc1ae 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 2.6.35
+ETHTOOL_VERSION = 2.6.36
 ETHTOOL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
-- 
1.7.3.4
