From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 18:18:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump version to 1.3.0
Message-ID: <20170730161845.4297-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liquid-dsp/liquid-dsp.hash | 2 +-
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index e32d8290c..ecee47447 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d0f050b9d5137c43ba45a35b6c82bc8222eba86f772f4e2e46c91427647bb847 liquid-dsp-1191179b786703b3af20abf7e1404d91099b335d.tar.gz
+sha256 b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0  liquid-dsp-v1.3.0.tar.gz
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 35994137e..e3114a2d1 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1191179b786703b3af20abf7e1404d91099b335d
+LIQUID_DSP_VERSION = v1.3.0
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
-- 
2.11.0
