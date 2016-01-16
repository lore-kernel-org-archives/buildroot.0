From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:51 +0100
Subject: [Buildroot] [PATCH 59/80 v1] package/ncurses: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <7b19909ef836916734e10ee0fa1d01cf6037898e.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

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
1.9.1
