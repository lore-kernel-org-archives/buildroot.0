From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:45 +0100
Subject: [Buildroot] [PATCH 76/84 RFC] package/openobex: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <ce9d0a5706989c176af6880fe98d4240e431e80e.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openobex has 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openobex/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 5f606fe..d2fd95f 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENOBEX
+menuconfig BR2_PACKAGE_OPENOBEX
 	bool "openobex"
 	help
 	  Free open source implementation of the Object Exchange (OBEX)
-- 
1.9.1
