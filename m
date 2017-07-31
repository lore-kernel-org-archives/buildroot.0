From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:52:06 +0200
Subject: [Buildroot] [git commit] package/liquid-dsp: bump version to 1.3.0
Message-ID: <20170731184800.0592380AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35dbe40189fab0020d2a3d40e0b8d56d23fd502d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/liquid-dsp.hash | 2 +-
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index e32d829..ecee474 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d0f050b9d5137c43ba45a35b6c82bc8222eba86f772f4e2e46c91427647bb847 liquid-dsp-1191179b786703b3af20abf7e1404d91099b335d.tar.gz
+sha256 b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0  liquid-dsp-v1.3.0.tar.gz
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 3599413..e3114a2 100644
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
