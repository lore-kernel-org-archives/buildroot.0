From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  3 Apr 2013 07:50:41 -0300
Subject: [Buildroot] [PATCH] quota: needs host-gettext
Message-ID: <1364986241-12838-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ce1016e38e3e629dec8a54fa2d1436252831e0bf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 899dfdd..c89ed9b 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -7,7 +7,7 @@
 QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
-
+QUOTA_DEPENDENCIES = host-gettext
 QUOTA_AUTORECONF = YES
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
-- 
1.8.1.5
