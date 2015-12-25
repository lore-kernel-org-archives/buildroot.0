From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:17 +0100
Subject: [Buildroot] [PATCH 48/84 RFC] package/sdl: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <fb934f944609af8316441b63250dd5043cebd8dc.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sdl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 65ac8a2..e0a4437 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SDL
+menuconfig BR2_PACKAGE_SDL
 	bool "SDL"
 	help
 	  Simple DirectMedia Layer - SDL is a library that allows
-- 
1.9.1
