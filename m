From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:58 +0200
Subject: [Buildroot] [PATCH 6/8] cgilua: bump rockspec revision
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/cgilua.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index bdb1411..5934ffd 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4-1
+CGILUA_VERSION = 5.1.4-2
 CGILUA_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.9.1
