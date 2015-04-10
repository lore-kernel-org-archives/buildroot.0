From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 21:54:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-addon-xvdr: bump version and
	switch to branch kodi-helix
Message-ID: <1428695666-10412-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index e05510c..1d654e2 100644
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Helix branch is made, we should
-# follow it, as incompatible changes in the plugins API can happen
-# on the master branch.
-KODI_ADDON_XVDR_VERSION = 328fa653b821a4edc1256a13833f30a4483e2819
+# This cset is on helix. When an Isengard branch is made, we should
+# follow it or switch to master, as incompatible changes in the plugins
+# API can happen.
+KODI_ADDON_XVDR_VERSION = c5eff57b810b815d052d02163b314fd06223b30a
 KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
 KODI_ADDON_XVDR_LICENSE = GPLv2+
 KODI_ADDON_XVDR_LICENSE_FILES = COPYING
-- 
1.7.10.4
