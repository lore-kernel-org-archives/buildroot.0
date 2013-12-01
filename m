From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Dec 2013 23:36:07 +0100
Subject: [Buildroot] [PATCH 4/4] package/tvheadend: bump version
In-Reply-To: <cover.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <be562b7c43e4f2b1665baf2168b31a6a2379e20d.1385937338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Misc fixes and improvements all over the place, mostly fixes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7578dab..1713d58 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 2b649954346aa2e9c81834d500a25c528f31f829
+TVHEADEND_VERSION           = c7d0335eb10d02b780423bef8e7c740e422fff13
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
-- 
1.8.1.2
