From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:16:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libvpx: add
 LIBVPX_CPE_ID_VENDOR
Message-ID: <20210404095236.BEE748679B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371f8b683e71fdb81424d080b605b94bd9be004e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:webmproject:libvpx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebmproject%3Alibvpx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cb6ffd93ec5c89ab90a2d4efd032ef4b774070b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpx/libvpx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 26d211cf86..3093242d14 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -8,6 +8,7 @@ LIBVPX_VERSION = 1.9.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
+LIBVPX_CPE_ID_VENDOR = webmproject
 LIBVPX_INSTALL_STAGING = YES
 
 # ld is being used with cc options. therefore, pretend ld is cc.
