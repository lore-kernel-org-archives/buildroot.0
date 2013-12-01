From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:51:07 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: bump version
Message-ID: <20131201225157.B5D789BBE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9053a3455104a23dd618dd203bbb270a03f7d038
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for scanning DVBS, misc compiler warnings suppressed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/dvb-apps.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
