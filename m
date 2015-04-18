From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:30:56 +0200
Subject: [Buildroot] [git commit] copas: bump to version 2.0.0
Message-ID: <20150418133114.9FC007FA59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f79c30c195aa8170e0fb1cfd0aa4493b05c38ba1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/copas/copas.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
