From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 17:41:14 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-addons: bump version
Message-ID: <20150327164118.365D6818E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aef914c2bea40c224d002ed6cd164d029bfed98f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index 2db8d3a..1a09265 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'helix'
 # When Kodi is updated, this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = a0a437eac14c9532ea0c6d38f8f222a612aea147
+KODI_PVR_ADDONS_VERSION = 4854fbe9dc0499ca8d1e10e8c18e329d3eb48814
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
