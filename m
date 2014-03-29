From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:31:21 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: do not line-up variables
Message-ID: <20140329173147.7DD9C9C42A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eee4504862b5af82378193719f8b0bb570de3dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvb-apps/dvb-apps.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

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
