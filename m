From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:02:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-vbox: bump version
Message-ID: <20151020200500.6BB7C7FB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3c747674635c8c55692e6772868ced1fa650487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 338c29a..6bb7769 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 874eb8812db1dd1b2626ed6c9f8391790f0e6818
+KODI_PVR_VBOX_VERSION = 0b1d571f0259583671c9654febf2bf45a8e9920c
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
