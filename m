From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 22:52:02 +0100
Subject: [Buildroot] [git commit] package/sdl2: update SDL2_CPE_ID_PRODUCT
Message-ID: <20210305212957.608BC8750F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d2c4f696c04cae854b792f3d9ca5ae1e340ebe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsdl:sdl has been replaced by libsdl:simple_directmedia_layer:
  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asimple_directmedia_layer

  <cpe-item name="cpe:/a:libsdl:sdl:2.0.12" deprecated="true" deprecation_date="2021-02-08T18:56:07.243Z">
      <reference href="https://www.libsdl.org/release/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:libsdl:sdl:2.0.12:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:libsdl:simple_directmedia_layer:2.0.12:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index dfe5ec8802..48148d38e3 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -10,7 +10,7 @@ SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
 SDL2_LICENSE_FILES = COPYING.txt
 SDL2_CPE_ID_VENDOR = libsdl
-SDL2_CPE_ID_PRODUCT = sdl
+SDL2_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL2_INSTALL_STAGING = YES
 SDL2_CONFIG_SCRIPTS = sdl2-config
 
