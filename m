From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 17:50:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump version to 1.3.2
Message-ID: <20191006155013.29022-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liquid-dsp/liquid-dsp.hash | 3 ++-
 package/liquid-dsp/liquid-dsp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index d0041ab665..31bcd68767 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0  liquid-dsp-1.3.0.tar.gz
+sha256 85093624ef9cb90ead64c836d2f42690197edace1a86257d6524c4e4dc870483  liquid-dsp-1.3.2.tar.gz
+sha256 4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 1dd9921ecd..9745893b7c 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = 1.3.0
+LIQUID_DSP_VERSION = 1.3.2
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
-- 
2.20.1
