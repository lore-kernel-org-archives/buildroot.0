From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:36:03 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_mkfontscale: bump
 version to 1.1.3
Message-ID: <20180311084455.EE2AF8007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddc63729cb3041c0fa5a771b34ca711ca08765fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 9 +++++++--
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
index 0cab2b2d1b..b0776a412b 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002520.html
-sha256	8c6d5228af885477b9aec60ca6f172578e7d2de42234357af62fb00439453f20	mkfontscale-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002855.html
+md5 987c438e79f5ddb84a9c5726a1610819  mkfontscale-1.1.3.tar.bz2
+sha1 2fdbd7c6cc5b0678f2c5d10d2350a809d576e9e5  mkfontscale-1.1.3.tar.bz2
+sha256 1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a  mkfontscale-1.1.3.tar.bz2
+sha512 509e2f9cd55cf87cc3968c8767bf3f2386016278db8b7be75b7df34bf61f52519dd2778f3b9881ffbe30cc2fe26089c0a5b2c33af46bc7727f46dad83f030a62  mkfontscale-1.1.3.tar.bz2
+# Locally computed
+sha256 90f0a1bfee2ed42c63473ded631c0463bf38b3d193733ccfc35394c713a0701d  COPYING
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index d7abf6c5bb..12416b4d6b 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.1.2
+XAPP_MKFONTSCALE_VERSION = 1.1.3
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
