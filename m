From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Sep 2017 19:50:36 +0200
Subject: [Buildroot] [PATCH 02/12] copas: add LICENSE_FILES
In-Reply-To: <20170904175046.21530-1-francois.perrad@gadz.org>
References: <20170904175046.21530-1-francois.perrad@gadz.org>
Message-ID: <20170904175046.21530-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/copas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 5ab547378..988692c4a 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -7,5 +7,6 @@
 COPAS_VERSION = 2.0.2-1
 COPAS_SUBDIR = copas-2_0_2
 COPAS_LICENSE = MIT
+COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
-- 
2.11.0
