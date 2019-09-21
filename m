From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:26 +0200
Subject: [Buildroot] [PATCH v6 25/25] package/kodi-visualisation-*: mass
 version bump
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-26-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased
package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-fishbmc.hash                           | 2 +-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk  | 4 ++--
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash  | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk    | 2 +-
 ...01-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch | 4 ++--
 .../kodi-visualisation-shadertoy.hash                         | 2 +-
 .../kodi-visualisation-shadertoy.mk                           | 4 ++--
 .../kodi-visualisation-spectrum.hash                          | 2 +-
 .../kodi-visualisation-spectrum.mk                            | 4 ++--
 .../kodi-visualisation-waveform.hash                          | 2 +-
 .../kodi-visualisation-waveform.mk                            | 4 ++--
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 21d80a31cb..53fffb2e57 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-4.1.0.tar.gz
+sha256 6e93bad1eacfcb25de8794e6bb3027b2490909616c157a54da820ce12151820a  kodi-visualisation-fishbmc-92ab0dfbba5f715221df85f3c1d21427917b5939.tar.gz
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 8360660ef4..c04786581c 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 4.1.0
-KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,v$(KODI_VISUALISATION_FISHBMC_VERSION))
+KODI_VISUALISATION_FISHBMC_VERSION = 92ab0dfbba5f715221df85f3c1d21427917b5939
+KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index fa5fbf6c37..42d2222828 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 501b8b1d5bd174ec71d57894293ae5eb0c1f41c3b725ab5e7b5a1c5eeea77a7f  kodi-visualisation-goom-54da35870930acd1a3a36195dd2c1498ac336b90.tar.gz
+sha256 6f0e310ae71897be711fbe1b61483cc369eb4415934538cf71f90bf66f2965fa  kodi-visualisation-goom-6860bdaa2a84b3557ca7c394e62d134c7c570a35.tar.gz
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index a7503a97d8..6b92183c6b 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 54da35870930acd1a3a36195dd2c1498ac336b90
+KODI_VISUALISATION_GOOM_VERSION = 6860bdaa2a84b3557ca7c394e62d134c7c570a35
 KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
index 8de96a6de3..ed731a18fb 100644
--- a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
+++ b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
@@ -18,12 +18,12 @@ index 8b084cf..81bbe27 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -35,7 +35,7 @@
-     endif()
+     message(FATAL_ERROR "No rendering API found. Bailing")
    endif()
  
 -  include_directories(${OpenGL_INCLUDE_DIR}
 +  include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
-                       ${KODI_INCLUDE_DIR}
+                       ${KODI_INCLUDE_DIR}/.. # Hack way with "/..", need bigger Kodi cmake rework to match right include ways (becomes done in future)
                        ${p8-platform_INCLUDE_DIRS}
                        ${PROJECT_SOURCE_DIR}/lib/kissfft
 diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index ae8c59ddb0..77358f8366 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-1.1.5.tar.gz
+sha256 a39ad8396393c7e07421d66bdc162615bdb8a742ff98af68fdbe05994d1069b7  kodi-visualisation-shadertoy-47a78c9f7b7cb03d7d8a6b50e37659550d3227b4.tar.gz
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index a2b1b14d9f..52e73e4cd5 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 1.1.5
-KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,v$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_VERSION = 47a78c9f7b7cb03d7d8a6b50e37659550d3227b4
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 2d9ab0f3cf..5140ade485 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-1.1.1.tar.gz
+sha256 cae651368036e9ad113061121461ec4596e01ab4842ea39215cc28fb8e8f12c3  kodi-visualisation-spectrum-77519bc728bd8c56172e4c8f762f07b95204331d.tar.gz
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 016f405e40..353140fc7a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 1.1.1
-KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_VERSION = 77519bc728bd8c56172e4c8f762f07b95204331d
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 271dc4a9e0..50b327ed7b 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-1.1.0.tar.gz
+sha256 3b208f17a785cb6f9e8f87ee97bffa2df8176fad5d4da97db026187ed337b827  kodi-visualisation-waveform-ae4400e1dd04b3d450a39a5bb0087370287f6464.tar.gz
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 13a621edb0..7fc610e7ca 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 1.1.0
-KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,v$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_VERSION = ae4400e1dd04b3d450a39a5bb0087370287f6464
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
-- 
2.20.1
