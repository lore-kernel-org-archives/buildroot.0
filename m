From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:14 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 12/15] copas: bump to version
	1.2.1
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-13-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/copas.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 3021139..e24549e 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-COPAS_VERSION = 1.1.6-1
+COPAS_VERSION = 1.2.1-1
+COPAS_SUBDIR  = copas-1_2_1
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.7.9.5
