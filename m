From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Sep 2011 16:47:32 -0300
Subject: [Buildroot] [PATCH 4/4] smartmontools: bump to version 5.41
In-Reply-To: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
References: <1317412052-28859-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1317412052-28859-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/smartmontools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d941504..d14e740 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 5.40
+SMARTMONTOOLS_VERSION = 5.41
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
