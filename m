From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  2 Jun 2015 18:32:55 +0200
Subject: [Buildroot] [PATCH 1/5] dado: bump to version 1.6.0
Message-ID: <1433262779-20797-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dado/dado.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index 3a58215..a09dd6d 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DADO_VERSION = 1.5.2-1
+DADO_VERSION = 1.6.0-1
 DADO_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.1.4
