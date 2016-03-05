From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:38 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-pctv: bump version
Message-ID: <20160305203005.64756817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e13ec36b4b3a2bff54219ea780104092a5e2be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index b604eb7..0ff481a 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 55febfb72348e87c496cf4843cbf0f95793a5b3cdee5a10808455a68a483a4fa kodi-pvr-pctv-8b3ad52f63cd0abff4f4e39c1a5b96b868a8d817.tar.gz
+sha256 4c045722c326dfe152ffadb8d966e8db4caa6128a7c53b2a852fce85f803bcbc kodi-pvr-pctv-0096770e96f84c46f444e159b9b737ac8b4238dc.tar.gz
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 73d71d8..a9824d5 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_PCTV_VERSION = 8b3ad52f63cd0abff4f4e39c1a5b96b868a8d817
+KODI_PVR_PCTV_VERSION = 0096770e96f84c46f444e159b9b737ac8b4238dc
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
