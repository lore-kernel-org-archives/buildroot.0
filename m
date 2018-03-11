From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:31:56 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_appres: bump version to
 1.0.5
Message-ID: <20180311084455.875847F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24b70f68eadde7509d5fda8a37b6757dc9e32c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_appres/xapp_appres.hash | 9 +++++++--
 package/x11r7/xapp_appres/xapp_appres.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.hash b/package/x11r7/xapp_appres/xapp_appres.hash
index a1cbf0b4b9..8750e2d14c 100644
--- a/package/x11r7/xapp_appres/xapp_appres.hash
+++ b/package/x11r7/xapp_appres/xapp_appres.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002211.html
-sha256	9f614e9427cd9641a4a801ed5055700afa410674c0b7aa186b86078f11b83e8d	appres-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002847.html
+md5 f544e701043249d2bb3deed48314bc55  appres-1.0.5.tar.bz2
+sha1 5e5dbffd0a125732bb8bb8a202e04555a9604089  appres-1.0.5.tar.bz2
+sha256 ffad893712c81943b919e3cbfe46fc65259cc0d9eb96d5e658670e3fbb265928  appres-1.0.5.tar.bz2
+sha512 70825563cd80f0f433c48ab2fdae888072939c1b22fb22340b70b9444c97916275ed92c9e5bf9a06bb76c32a5371b89ff7c0211a9a47a227c88311078c2c4137  appres-1.0.5.tar.bz2
+# Locally computed
+sha256 5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index b84d7426c6..4159332bd3 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.4
+XAPP_APPRES_VERSION = 1.0.5
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_LICENSE = MIT
