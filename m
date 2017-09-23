From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Sep 2017 14:02:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/kodi-pvr-hts: bump version to
	3.4.28
In-Reply-To: <20170923120243.24993-1-bernd.kuhls@t-online.de>
References: <20170923120243.24993-1-bernd.kuhls@t-online.de>
Message-ID: <20170923120243.24993-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fixed hash

 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index bf0a7361b9..87eafac855 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4fb24496622762ea8c894368bdababd2104c5f70978b901b983974ef389b83e1  kodi-pvr-hts-3.4.27.tar.gz
+sha256 96e949526ebf4af542da572e704c0c052ec807408dc0ea65603a15614b889dd1  kodi-pvr-hts-3211941dade740ad92581f488402146794798e74.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 182fd4b0dc..7f43b04853 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 3.4.27
+KODI_PVR_HTS_VERSION = 3211941dade740ad92581f488402146794798e74
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
-- 
2.11.0
