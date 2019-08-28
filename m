From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:42:17 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_viewres: bump version
 to 1.0.6
Message-ID: <20190903133623.4A7508A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed0c94d94dccc83e5e189960e10ab209a4a80211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_viewres/xapp_viewres.hash | 10 +++++-----
 package/x11r7/xapp_viewres/xapp_viewres.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_viewres/xapp_viewres.hash b/package/x11r7/xapp_viewres/xapp_viewres.hash
index 539bb431ee..9b40c0a533 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.hash
+++ b/package/x11r7/xapp_viewres/xapp_viewres.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002849.html
-md5 08def461f135832136624855763b20fa  viewres-1.0.5.tar.bz2
-sha1 d03832456dde6c2a91086e6563d52fd936425948  viewres-1.0.5.tar.bz2
-sha256 5ed818e84c39bcf26dadc885c9860432b85843caad3621e26d99edea660ae3d7  viewres-1.0.5.tar.bz2
-sha512 fe573e9b5ae679b65eee95733cbea20c86c92089c3a2dadfe977bc9c54d1f58c5e5f4663e51a1cf206543a43592b3a3c266da1769279f08be85c66b0aa5b0f7f  viewres-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-August/003020.html
+md5 38e6568271d8098327706c5cf855dbc7  viewres-1.0.6.tar.bz2
+sha1 f1d12e5b4e1180916edb44234599a486b025b480  viewres-1.0.6.tar.bz2
+sha256 11c15db02066c1d5fc3febf9b185d16c1112f87e37c4b101a484dcefffb80934  viewres-1.0.6.tar.bz2
+sha512 3f4cfc61608bc6c9b35ef66ceb473661ca01946d3306d54040d32803e8e0eec506a0ce37ea22bfe514544a6ba9645fd30f39b20c063aff696b3c0fda3fe95dff  viewres-1.0.6.tar.bz2
 # Locally computed
 sha256 aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index e32de0f732..2e05a6e7d9 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_VIEWRES_VERSION = 1.0.5
+XAPP_VIEWRES_VERSION = 1.0.6
 XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_LICENSE = MIT
