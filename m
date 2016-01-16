From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:38:03 +0100
Subject: [Buildroot] [PATCH 71/80 v1] package/sqlite: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <d326cd4401c9b9dc7ec5f5d4565128f2436977d3.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sqlite has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
