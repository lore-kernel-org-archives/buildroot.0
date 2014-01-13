From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:19:28 +0100
Subject: [Buildroot] [git commit] copas: bump to version 1.2.1
Message-ID: <20140113222142.3AC169C4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=072400c65cb03822647479d3cb42f659d949c045
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/copas/copas.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
