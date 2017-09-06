From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:27:36 +0200
Subject: [Buildroot] [git commit] copas: add LICENSE_FILES
Message-ID: <20170906203033.408DF80559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0044e612ec4452dfb56857287da170da872b1ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/copas/copas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 5ab5473..988692c 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -7,5 +7,6 @@
 COPAS_VERSION = 2.0.2-1
 COPAS_SUBDIR = copas-2_0_2
 COPAS_LICENSE = MIT
+COPAS_LICENSE_FILES = $(COPAS_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
