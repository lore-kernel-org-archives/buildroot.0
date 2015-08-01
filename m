From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Aug 2015 10:16:13 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-dvblink: bump
	version
Message-ID: <20150808105652.913227FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14e6c8208ce88d67ba8bda897980175df9949277
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 902c7f3..88e90c1 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = cf756e9241c58d98c3b56dfcae89da9f35e4555f
+KODI_PVR_DVBLINK_VERSION = b87e8a79a329c2f808a5d5abffe05259e365d7e6
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPLv2+
 KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
