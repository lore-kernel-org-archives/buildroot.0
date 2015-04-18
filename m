From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 18 Apr 2015 10:57:58 +0200
Subject: [Buildroot] [PATCH 2/3] copas: bump to version 2.0.0
In-Reply-To: <1429347479-7171-1-git-send-email-francois.perrad@gadz.org>
References: <1429347479-7171-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1429347479-7171-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/copas.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 9bc38e4..b3f97c7 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COPAS_VERSION = 1.2.1-1
-COPAS_SUBDIR = copas-1_2_1
+COPAS_VERSION = 2.0.0-1
+COPAS_SUBDIR = copas-2_0_0
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.1.0
