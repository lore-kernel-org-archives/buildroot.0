From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:04 -0300
Subject: [Buildroot] [PATCH 25/45] dvb_apps: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dvb-apps/dvb-apps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 2d816c5..b5b8a1f 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -7,7 +7,7 @@
 DVB_APPS_VERSION = 3d43b280298c39a67d1d889e01e173f52c12da35
 DVB_APPS_SITE = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD = hg
-DVB_APPS_LICENSE = GPLv2 GPLv2+ LGPLv2.1+
+DVB_APPS_LICENSE = GPLv2, GPLv2+, LGPLv2.1+
 DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-- 
2.4.10
