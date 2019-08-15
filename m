From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Aug 2019 16:01:43 +0200
Subject: [Buildroot] [PATCH 1/4] package/batman-adv: fix license
Message-ID: <20190815140146.28224-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

batman_adv.h is licensed under MIT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/batman-adv/batman-adv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 51799186d8..2cebe13562 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -6,7 +6,7 @@
 
 BATMAN_ADV_VERSION = 2017.0.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
-BATMAN_ADV_LICENSE = GPL-2.0
+BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 
 # Bridge Loop Avoidance, Distributed Arp Table are always enabled
 BATMAN_ADV_CFLAGS = \
-- 
2.20.1
