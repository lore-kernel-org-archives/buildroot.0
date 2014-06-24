From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 16:15:23 -0300
Subject: [Buildroot] [PATCH 1/2] irda-utils: add license information
Message-ID: <1403637324-13994-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/irda-utils/irda-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 4be80d7..e4958e5 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -6,6 +6,8 @@
 
 IRDA_UTILS_VERSION = 0.9.18
 IRDA_UTILS_SITE = http://downloads.sourceforge.net/project/irda/irda-utils/$(IRDA_UTILS_VERSION)
+IRDA_UTILS_LICENSE = GPLv2+
+IRDA_UTILS_LICENSE_FILES = man/COPYING
 
 IRDA_UTILS_CFLAGS = $(TARGET_CFLAGS) -I.
 ifeq ($(BR2_USE_MMU),)
-- 
1.8.5.5
