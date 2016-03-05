From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:43 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-vuplus: bump version
Message-ID: <20160305203005.950A5817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d7fd8c4281e0f6364f257690ce62db8978c564c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 1a728df..efdb125 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 036d2d316247f0c4b7d598a27a387f6653683ea686ef62d3bf3b3b0edae69d13 kodi-pvr-vuplus-84ee66d16479dd8c9a65868af427670d9e9d02aa.tar.gz
+sha256 9684775c296dfd9b925d73ed1c21bee45afba4785d1bfb226f98b09ed235a8ee kodi-pvr-vuplus-815ea2f303dbe7dd19f87c53965dfdf2358fcdc8.tar.gz
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index f22ca35..e839bcc 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VUPLUS_VERSION = 84ee66d16479dd8c9a65868af427670d9e9d02aa
+KODI_PVR_VUPLUS_VERSION = 815ea2f303dbe7dd19f87c53965dfdf2358fcdc8
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPLv2+
 KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
