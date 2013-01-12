From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 00:50:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/dvb-apps: bump version
In-Reply-To: <cover.1358034598.git.yann.morin.1998@free.fr>
References: <cover.1358034598.git.yann.morin.1998@free.fr>
Message-ID: <09c3abe5fabc0826ae43f87f625018dd71f1e7c7.1358034598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version has new transponders data for CZ.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
 
-- 
1.7.2.5
