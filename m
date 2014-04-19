From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:53 +0200
Subject: [Buildroot] [PATCH 1/8] cosmo: bump to version 14.03.04
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cosmo/cosmo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cosmo/cosmo.mk b/package/cosmo/cosmo.mk
index 2592f62..0ab5324 100644
--- a/package/cosmo/cosmo.mk
+++ b/package/cosmo/cosmo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COSMO_VERSION = 13.01.30-1
+COSMO_VERSION = 14.03.04-1
 COSMO_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.9.1
