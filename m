From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:50:47 +0100
Subject: [Buildroot] [git commit] package/sdl2: add CPE variables
Message-ID: <20210126183304.88593817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38fd9b8448856567de57fac2f32deab52219511f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libsdl:sdl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2/sdl2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index bf43d71f04..dfe5ec8802 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -9,6 +9,8 @@ SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
 SDL2_LICENSE_FILES = COPYING.txt
+SDL2_CPE_ID_VENDOR = libsdl
+SDL2_CPE_ID_PRODUCT = sdl
 SDL2_INSTALL_STAGING = YES
 SDL2_CONFIG_SCRIPTS = sdl2-config
 
