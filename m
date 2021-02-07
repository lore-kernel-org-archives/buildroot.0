From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 12:56:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/pigz: bump version to 2.6
Message-ID: <20210207115637.1165284-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash due to various commits bumping the version number:
https://github.com/madler/pigz/commits/master/README

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pigz/pigz.hash | 4 ++--
 package/pigz/pigz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index ec75b4e530..512bf785c7 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-2.4.tar.gz
-sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
+sha256  577673676cd5c7219f94b236075451220bae3e1ca451cf849947a2998fbf5820  pigz-2.6.tar.gz
+sha256  830b3e1b05cc20f443d89d7d8703a3c63fd64c57ab716f5e81fd178517df1e11  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index 23df0f5fcb..fdf5fa40e8 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.4
+PIGZ_VERSION = 2.6
 PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
-- 
2.29.2
