From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Aug 2017 22:15:25 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/kodi-inputstream-adaptive:
	bump version to latest Krypton release
In-Reply-To: <20170822201526.3285-1-bernd.kuhls@t-online.de>
References: <20170822201526.3285-1-bernd.kuhls@t-online.de>
Message-ID: <20170822201526.3285-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not depend on a fixed version anymore but uses the latest
commit of the Krypton branch:
https://github.com/xbmc/repo-binary-addons/commit/2f3dfcfa97249ab01808c79a88d5b3d33bf5d620

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index e461bd97a..c7de62a4f 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cb0fa6f8326b439006701890d3fd90621b4f6f2db6055a9abe781b089170d28f  kodi-inputstream-adaptive-1.0.8_k17.tar.gz
+sha256 4691ac8bde78b5abb2847cf6ad64d36141c0582f944ba435eafe7702cc2d1187  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index e5a197cd4..8d7daefc4 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 1.0.8_k17
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 161f319bb2cd946f4659d841a54f19b1fb6143cc
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
-- 
2.11.0
