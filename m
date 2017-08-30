From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:27:32 +0200
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
	version to latest Krypton release
Message-ID: <20170902130621.284498016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b7cbd65d65a86c54304cdd0013fe2dadc5bcc0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not depend on a fixed version anymore but uses the latest
commit of the Krypton branch:
https://github.com/xbmc/repo-binary-addons/commit/2f3dfcfa97249ab01808c79a88d5b3d33bf5d620

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index e461bd9..c7de62a 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cb0fa6f8326b439006701890d3fd90621b4f6f2db6055a9abe781b089170d28f  kodi-inputstream-adaptive-1.0.8_k17.tar.gz
+sha256 4691ac8bde78b5abb2847cf6ad64d36141c0582f944ba435eafe7702cc2d1187  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index e5a197c..8d7daef 100644
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
