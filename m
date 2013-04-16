From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 21:47:57 -0300
Subject: [Buildroot] [PATCH 2/4] bison: bump to version 2.7.1
In-Reply-To: <1366073279-28652-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366073279-28652-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366073279-28652-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 31fc22c..24c2576 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.7
+BISON_VERSION = 2.7.1
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
-- 
1.8.1.5
