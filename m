From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 20:54:13 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: bump version
Message-ID: <20130113195429.C2CDA7FDE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0295258dadea23b21eb0890b94e59b6258759268
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version has new transponders data for CZ.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dvb-apps/dvb-apps.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 86af824..31a4ff8 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DVB_APPS_VERSION        = 3fc7dfa68484
+DVB_APPS_VERSION        = 83c746462ccb
 DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
 DVB_APPS_SITE_METHOD    = hg
 
