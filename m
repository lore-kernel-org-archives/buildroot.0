From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:23 +0200
Subject: [Buildroot] [PATCH 72/83 v2] package/sqlite: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <28ec18cbd4bff903be358b7041fa2a901165caca.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sqlite has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sqlite/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index c9fde53..c7d6c70 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_SQLITE
+menuconfig BR2_PACKAGE_SQLITE
 	bool "sqlite"
 	help
 	  SQLite is a small C library that implements a self-contained,
-- 
2.7.4
