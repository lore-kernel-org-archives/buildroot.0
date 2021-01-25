From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 22:50:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: add CPE variables
Message-ID: <20210125215055.1177383-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libsdl:sdl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2/sdl2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 26b38eccda..ca4f602360 100644
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
 
-- 
2.29.2
