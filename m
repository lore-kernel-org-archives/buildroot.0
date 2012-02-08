From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 14:29:36 +0100
Subject: [Buildroot] [git commit] libevas: SDL GL backend doesn't need
	glproto
Message-ID: <20120208133907.5EE3990391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38071138ee1cf3b904a8fc25a4a9bcefe0d9be6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 4615749..b5fb50e 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -79,7 +79,6 @@ config BR2_PACKAGE_LIBEVAS_SDL
 config BR2_PACKAGE_LIBEVAS_SDL_GL
 	bool "libevas SDL OpenGL backend"
 	depends on BR2_PACKAGE_SDL_X11
-	select BR2_PACKAGE_XPROTO_GLPROTO
 	help
 	  This is the SDL OpenGL engine that uses SDL library
 	  and OpenGL to render. This may be hardware accelerated.
