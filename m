From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 22:46:33 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-addons: bump version
Message-ID: <20150131222039.A4DD18046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f59b00c7ed3ac6895af0ef4b42e090e09d813005
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index 0ca0457..2db8d3a 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'helix'
 # When Kodi is updated, this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 7aec58f67c799e83e0c1c490ceda39dc119f2c7d
+KODI_PVR_ADDONS_VERSION = a0a437eac14c9532ea0c6d38f8f222a612aea147
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
