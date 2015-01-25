From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:00:58 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-addons: bump version
Message-ID: <20150125140101.97D7D8046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a2aa94e6ced5aef6c13d425feac996c3759f7f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index bb4dbf5..0ca0457 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'helix'
 # When Kodi is updated, this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 9f63d1bc39ffcb28f8aea580ea0669211e4d16e5
+KODI_PVR_ADDONS_VERSION = 7aec58f67c799e83e0c1c490ceda39dc119f2c7d
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
