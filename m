From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Dec 2017 21:00:40 -0000
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version
Message-ID: <20171201205314.405897F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fac7499d6654038d0d4312bbb88f785044b5887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The git hash translates into version 2.0.19.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 0d8f39f..78b48c1 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a214b6f47d4fcd0ceb78819447eb9ff3c5b4519233a46a245c9b558ecda0725f  kodi-inputstream-adaptive-f2904b547e940c724dce7412a26744c2698cab66.tar.gz
+sha256 572b2e898484a5ada74c4095539cebf43c198a3147f0f24fe350bc79db053695  kodi-inputstream-adaptive-9af21218a87572bd4ab8d8d660c11f6295144f97.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index cc09503..f7a4c66 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = f2904b547e940c724dce7412a26744c2698cab66
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 9af21218a87572bd4ab8d8d660c11f6295144f97
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
