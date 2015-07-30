From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:24 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-addon-xvdr: bump
	version
Message-ID: <20150808105650.A58377FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27879bf24573bde97284459dd18623f6d079df6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-addon-xvdr/kodi-addon-xvdr.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
index e05510c..eff053e 100644
--- a/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
+++ b/package/kodi-addon-xvdr/kodi-addon-xvdr.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-# This cset is on master. When a Helix branch is made, we should
+# This cset is on master. When a Isengard branch is made, we should
 # follow it, as incompatible changes in the plugins API can happen
 # on the master branch.
-KODI_ADDON_XVDR_VERSION = 328fa653b821a4edc1256a13833f30a4483e2819
+KODI_ADDON_XVDR_VERSION = 88265b86896513a219acb8d5f0c0f77956fae939
 KODI_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(KODI_ADDON_XVDR_VERSION))
 KODI_ADDON_XVDR_LICENSE = GPLv2+
 KODI_ADDON_XVDR_LICENSE_FILES = COPYING
