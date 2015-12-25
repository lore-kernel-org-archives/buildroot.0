From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:31 +0100
Subject: [Buildroot] [PATCH 62/84 RFC] package/ncurses: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <906cdcb50b9e3c6d63274d2d3d23dd4599263fe8.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
