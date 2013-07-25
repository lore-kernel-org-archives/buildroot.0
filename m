From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 25 Jul 2013 17:42:32 +0200
Subject: [Buildroot] [PATCH 2/2] cpanminus: bump to version 1.6109
In-Reply-To: <1374766953-5614-1-git-send-email-francois.perrad@gadz.org>
References: <1374766953-5614-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1374766953-5614-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpanminus/cpanminus.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index a2cd44b..60a72ee 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPANMINUS_VERSION = 1.6002
+CPANMINUS_VERSION = 1.6109
 CPANMINUS_SOURCE = $(CPANMINUS_VERSION).tar.gz
 CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/archive
 CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
-- 
1.7.9.5
