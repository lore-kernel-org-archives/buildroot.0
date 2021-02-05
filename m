From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 08:05:33 +0100
Subject: [Buildroot] [git commit] package/ghostscript: add
 GHOSTSCRIPT_CPE_ID_VENDOR
Message-ID: <20210205064641.AAF478267E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d89ea3313d21ceeb5944d7d95185b754e2cf912a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:artifex:ghostscript is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aartifex%3Aghostscript

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index e6842631f2..5b50c94405 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -8,6 +8,7 @@ GHOSTSCRIPT_VERSION = 9.53.3
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
+GHOSTSCRIPT_CPE_ID_VENDOR = artifex
 GHOSTSCRIPT_DEPENDENCIES = \
 	host-lcms2 \
 	host-libjpeg \
