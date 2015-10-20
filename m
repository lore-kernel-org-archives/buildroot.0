From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:02:10 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: bump version
Message-ID: <20151020200500.25C567F91D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0c8994e26809a7d381eed453c1d3f70593c3f95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 8fb5c89..0ce333a 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 96c80267935d8edc4f6f92d16b540ef77cdcb1db
+KODI_PVR_ARGUSTV_VERSION = 32f03271cc3fb1b50edfacd2793d5ac70a98dd20
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
