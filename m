From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 16:37:25 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi-inputstream-adaptive: bump
	version to 2.0.18
Message-ID: <20170913143728.22827-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index c7de62a4f7..dac02d62da 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4691ac8bde78b5abb2847cf6ad64d36141c0582f944ba435eafe7702cc2d1187  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
+sha256 9c0a4eabcb795cc3c21337f2a06c3016ccf8749b8da56e3692ca032304700bab  kodi-inputstream-adaptive-f2904b547e940c724dce7412a26744c2698cab66.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8d7daefc4f..cc0950346e 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 161f319bb2cd946f4659d841a54f19b1fb6143cc
+# This cset is on the branch 'Krypton'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = f2904b547e940c724dce7412a26744c2698cab66
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
-- 
2.11.0
