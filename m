From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:39 +0100
Subject: [Buildroot] [git commit] dvb_apps: comma separate licenses
Message-ID: <20151215210844.8F633818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=439996f8fbc6029da04981112e70a86c0ecb37d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
