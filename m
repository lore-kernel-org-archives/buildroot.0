From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 00:06:32 +0200
Subject: [Buildroot] [PATCH] package/liquid-dsp: fix legal-info
Message-ID: <1444601192-29389-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file is named LICENSE, not COPYING.

Fixes:
    http://autobuild.buildroot.org/results/c82/c82baa5549bdca405e0f077c7ab8c77dcec9a582/
    http://autobuild.buildroot.org/results/9c7/9c76ce4f9d69db1aa67cc9c07e4c5c2e5e8d93e0/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
---
 package/liquid-dsp/liquid-dsp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 5a5f583..98b23a5 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -7,7 +7,7 @@
 LIQUID_DSP_VERSION = df5a459fa05dba4199c1299555891104cc1fdca7
 LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
-LIQUID_DSP_LICENSE_FILES = COPYING
+LIQUID_DSP_LICENSE_FILES = LICENSE
 LIQUID_DSP_INSTALL_STAGING = YES
 LIQUID_DSP_AUTORECONF = YES
 
-- 
1.9.1
