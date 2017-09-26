From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:50:14 +0200
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
	version to 2.0.18
Message-ID: <20170926215334.04B2281121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f11469fcd650f0ff401fa4f4ff1ed301c605855b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=10256

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index df717ef..0d8f39f 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 764941d87aa99408c48d91b5ddf237cd0251fb4cbafba3da188bb4a965220309  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
+sha256 a214b6f47d4fcd0ceb78819447eb9ff3c5b4519233a46a245c9b558ecda0725f  kodi-inputstream-adaptive-f2904b547e940c724dce7412a26744c2698cab66.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 8d7daef..cc09503 100644
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
