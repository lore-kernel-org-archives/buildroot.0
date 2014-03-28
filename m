From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:00:26 +0100
Subject: [Buildroot] [PATCH 09/10] package/dvb-apps: do not line-up variables
In-Reply-To: <cover.1395964430.git.yann.morin.1998@free.fr>
References: <cover.1395964430.git.yann.morin.1998@free.fr>
Message-ID: <b5d2ecc8962c5990368a153846ead697da70b649.1395964430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/dvb-apps.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index c5e1954..2a35d29 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -4,17 +4,17 @@
 #
 ################################################################################
 
-DVB_APPS_VERSION        = 3d43b280298c39a67d1d889e01e173f52c12da35
-DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
-DVB_APPS_SITE_METHOD    = hg
-DVB_APPS_LICENSE        = GPLv2 GPLv2+ LGPLv2.1+
-DVB_APPS_LICENSE_FILES  = COPYING COPYING.LGPL
+DVB_APPS_VERSION = 3d43b280298c39a67d1d889e01e173f52c12da35
+DVB_APPS_SITE = http://linuxtv.org/hg/dvb-apps
+DVB_APPS_SITE_METHOD = hg
+DVB_APPS_LICENSE = GPLv2 GPLv2+ LGPLv2.1+
+DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
 
 DVB_APPS_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-DVB_APPS_DEPENDENCIES    = libiconv
-DVB_APPS_LDFLAGS        += -liconv
+DVB_APPS_DEPENDENCIES = libiconv
+DVB_APPS_LDFLAGS += -liconv
 endif
 
 DVB_APPS_INSTALL_STAGING = YES
-- 
1.8.3.2
