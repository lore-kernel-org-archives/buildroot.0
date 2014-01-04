From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jan 2014 09:11:43 -0300
Subject: [Buildroot] [PATCH 2/4] haveged: bump to version 1.8
In-Reply-To: <1388837505-30232-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388837505-30232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1388837505-30232-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/haveged/haveged.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 99dbe41..c0e3ba3 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.7c
+HAVEGED_VERSION = 1.8
 HAVEGED_SITE = http://www.issihosts.com/haveged
 HAVEGED_LICENSE = GPLv3+
 HAVEGED_LICENSE_FILES = COPYING
-- 
1.8.3.2
