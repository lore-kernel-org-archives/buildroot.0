From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 23:15:19 +0200
Subject: [Buildroot] [git commit] package/fluidsynth: bump to version 2.2.0
Message-ID: <20210409204943.2C1C681571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e02d2e762eb94fde1f222df1b960dbd263fa946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v2.1.5, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.6
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.7
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.8
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.0

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 17e37e2479..12620f51c5 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b539b7c65a650b56f01cd60a4e83c6125c217c5a63c0c214ef6274894a677d00  fluidsynth-2.1.5.tar.gz
+sha256  928fb16f307507485bd1d9b010dafba8c747bce5de2ba47ab1705944c87013b6  fluidsynth-2.2.0.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index dc777e0bf9..4cce6d6448 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.5
+FLUIDSYNTH_VERSION = 2.2.0
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
