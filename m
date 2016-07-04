From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:09 +0200
Subject: [Buildroot] [PATCH 58/83 v2] package/ncurses: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <7b8de104c7fdf099b1d24bd5f2afb376111fb286.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses has 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ncurses/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 44713f9..0887b33 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NCURSES
+menuconfig BR2_PACKAGE_NCURSES
 	bool "ncurses"
 	help
 	  The Ncurses (new curses) library is a free software emulation of
-- 
2.7.4
