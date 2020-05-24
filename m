From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2020 10:58:00 +0200
Subject: [Buildroot] [PATCH] package/speexdsp+tremor: switch to new git
 repository
Message-ID: <20200524085800.2399-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original git server on git.xiph.org died, and the Xiph project has
now moved on to host their repositories on gitlab.comn instead.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/speexdsp/speexdsp.mk | 2 +-
 package/tremor/tremor.mk     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index 901f22b9e6..35c06dd833 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SPEEXDSP_VERSION = SpeexDSP-1.2.0
-SPEEXDSP_SITE = https://git.xiph.org/speexdsp.git
+SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp.git
 SPEEXDSP_SITE_METHOD = git
 SPEEXDSP_LICENSE = BSD-3-Clause
 SPEEXDSP_LICENSE_FILES = COPYING
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index 835fe36172..a865e681df 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TREMOR_VERSION = 7c30a66346199f3f09017a09567c6c8a3a0eedc8
-TREMOR_SITE = https://git.xiph.org/tremor.git
+TREMOR_SITE = https://gitlab.xiph.org/xiph/tremor.git
 TREMOR_SITE_METHOD = git
 TREMOR_LICENSE = BSD-3-Clause
 TREMOR_LICENSE_FILES = COPYING
-- 
2.20.1
