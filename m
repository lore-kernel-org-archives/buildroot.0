From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 22:51:51 +0100
Subject: [Buildroot] [git commit] package/sdl: add CPE variables
Message-ID: <20210305212957.5343A873CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3b6a0e6aa43ca6b82093175aeb57f76cef23517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libsdl:simple_directmedia_layer is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibsdl%3Asdl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 06564d610a..7389cd3edb 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -9,6 +9,8 @@ SDL_SOURCE = SDL-$(SDL_VERSION).tar.gz
 SDL_SITE = http://www.libsdl.org/release
 SDL_LICENSE = LGPL-2.1+
 SDL_LICENSE_FILES = COPYING
+SDL_CPE_ID_VENDOR = libsdl
+SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
 # we're patching configure.in, but package cannot autoreconf with our version of
