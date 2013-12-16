From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Mon, 16 Dec 2013 11:30:25 +0100
Subject: [Buildroot] [PATCH] mdadm: bump to version 3.3
Message-ID: <1387189825-18630-1-git-send-email-cvubrugier@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
---
 package/mdadm/mdadm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index e678591..4418986 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDADM_VERSION = 3.2.6
+MDADM_VERSION = 3.3
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPLv2+
-- 
1.8.5.1
