From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Dec 2013 23:36:06 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvb-apps: bump version
In-Reply-To: <cover.1385937338.git.yann.morin.1998@free.fr>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
Message-ID: <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fixes for scanning DVBS, misc compiler warnings suppressed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 8cf6a79..e351258 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVB_APPS_VERSION        = 83c746462ccb
+DVB_APPS_VERSION        = be76da69f250
 DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD    = hg
 
-- 
1.8.1.2
