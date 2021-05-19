From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/fluidsynth: add
 FLUIDSYNTH_CPE_ID_VENDOR
Message-ID: <20210519192209.AAF3E8877A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96e8d8350385f3db087ee256ece01dc4fc4c83a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:fluidsynth:fluidsynth is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afluidsynth%3Afluidsynth

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 13bca2271de122c10fe3c87d1020b29e7d75764b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluidsynth/fluidsynth.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index dc777e0bf9..e3269f5300 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -8,6 +8,7 @@ FLUIDSYNTH_VERSION = 2.1.5
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
+FLUIDSYNTH_CPE_ID_VENDOR = fluidsynth
 FLUIDSYNTH_INSTALL_STAGING = YES
 FLUIDSYNTH_DEPENDENCIES = libglib2
 
