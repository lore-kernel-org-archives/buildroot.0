From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 30 Jun 2015 23:58:11 +0200
Subject: [Buildroot] [PATCH 2/2] wmctrl: update URL address
In-Reply-To: <1435701491-17232-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1435701491-17232-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1435701491-17232-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/wmctrl/wmctrl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index a4e0d8e..f26b23e 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WMCTRL_VERSION = 1.07
-WMCTRL_SITE = http://tomas.styblo.name/wmctrl/dist
+WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
 WMCTRL_LICENSE = GPLv2+
 WMCTRL_LICENSE_FILES = COPYING
 
-- 
1.9.1
