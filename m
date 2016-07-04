From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:19 +0200
Subject: [Buildroot] [PATCH 68/83 v2] package/sdl: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <bc67f59d06fa678bc5f5d8b2beb2a54ff7a889a2.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.7.4
