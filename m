From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 08:52:13 +0200
Subject: [Buildroot] [git commit] Revert "package/kodi-inputstream-rtmp:
	bump version to 1.0.6"
Message-ID: <20170930065311.2414880737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6ee26621be6e863a2778ed8e2e50f71aaf129ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit eec04a7b7dc32749f9c1f5e0ac1087230c542f28.

The original commit bumped the package to a version which is at runtime
incompatible with Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index 4fc2b0e..f5a82d2 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 34bdb372ff1e2a26894b76adf0d1e7c68193488992508cc3d0948d60f682d5b3  kodi-inputstream-rtmp-d93d32d45dfa61ad4b27f166f08736bd416bc329.tar.gz
+sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-v1.0.4.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index c4617b9..80c4bcc 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = d93d32d45dfa61ad4b27f166f08736bd416bc329
+KODI_INPUTSTREAM_RTMP_VERSION = v1.0.4
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
