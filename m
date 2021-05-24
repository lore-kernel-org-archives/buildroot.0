From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:11:39 +0200
Subject: [Buildroot] [git commit branch/next] package/fluidsynth: bump to
 version 2.2.1
Message-ID: <20210524114431.EE6F38A45D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daa27958d472a118d38bdf31151879e9ffc17a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since v2.2.0, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.1

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 12620f51c5..08a19e23f8 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  928fb16f307507485bd1d9b010dafba8c747bce5de2ba47ab1705944c87013b6  fluidsynth-2.2.0.tar.gz
+sha256  1c56660f23f6c406b36646cc619fc2d2a5265d1d3290e79bcef4505bcd985fdd  fluidsynth-2.2.1.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 4cce6d6448..88b4ba4eda 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.0
+FLUIDSYNTH_VERSION = 2.2.1
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
