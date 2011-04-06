From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:11 +0200
Subject: [Buildroot] [PATCH 57/63] mesa3d: version bump to 7.10.1
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-58-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/x11r7/mesa3d/mesa3d.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index cb0690d..053efaa 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -3,7 +3,7 @@
 # mesa3d
 #
 #############################################################
-MESA3D_VERSION:=7.6.1
+MESA3D_VERSION:=7.10.1
 MESA3D_SOURCE:=MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE:=ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 
-- 
1.7.3.4
