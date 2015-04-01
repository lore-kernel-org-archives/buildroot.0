From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:13 +0200
Subject: [Buildroot] [PATCH/RFC 20/27] package/kodi-addon-xvdr: bump version
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index e05510c..55595a9 100644
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Helix branch is made, we should
+# This cset is on master. When an Isengard branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-KODI_ADDON_XVDR_VERSION = 328fa653b821a4edc1256a13833f30a4483e2819
+KODI_ADDON_XVDR_VERSION = 3453f901283e2b0506b0bf1b523e3f59f506c6fb
 KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
 KODI_ADDON_XVDR_LICENSE = GPLv2+
 KODI_ADDON_XVDR_LICENSE_FILES = COPYING
-- 
1.7.10.4
