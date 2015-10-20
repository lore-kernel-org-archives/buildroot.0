From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:02:37 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-stalker: bump version
Message-ID: <20151020200500.6394681E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ce6e66046ddeb92d6da0ee329c2c5bad01f242c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index c1baa8d..979a421 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 5f6eb1992ffd45a075ebb7bc4253c4a88bf65c80
+KODI_PVR_STALKER_VERSION = a89afb8a2f5e01e3d11f6887ba1f7c81aebd7515
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
