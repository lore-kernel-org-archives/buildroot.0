From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:24 +0100
Subject: [Buildroot] [PATCH 55/84 RFC] package/sqlite: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <300c46d5dfa68052cec6ca787c710c6e6b6f71c6.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sqlite has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sqlite/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 7ea9eb1..605495f 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SQLITE
+menuconfig BR2_PACKAGE_SQLITE
 	bool "sqlite"
 	help
 	  SQLite is a small C library that implements a self-contained,
-- 
1.9.1
