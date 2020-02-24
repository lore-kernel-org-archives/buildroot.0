From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 Feb 2020 21:58:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.1.1
Message-ID: <20200224205850.3922373-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This will fix a static build failure with readline thanks to
  https://github.com/FluidSynth/fluidsynth/commit/c538c9fa7e392ce16c3354696e7dc7781a78a300
- Update indentation of hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/88609eefe55af2ca50d43e17d3424b923528b07a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/fluidsynth.hash | 4 ++--
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 5c5c226cbc..f7c9c88cd2 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 526addc6d8445035840d3af7282d3ba89567df209d28e183da04a1a877da2da3  fluidsynth-2.1.0.tar.gz
-sha256 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
+sha256  966d0393591b505d694e51cbf653387007144e9ae0b8705d82ec7d943d31d348  fluidsynth-2.1.1.tar.gz
+sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index ae0e395cfe..fbfaaa12c0 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.0
+FLUIDSYNTH_VERSION = 2.1.1
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.25.0
