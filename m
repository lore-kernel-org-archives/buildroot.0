From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:40 +0100
Subject: [Buildroot] [PATCH 71/84 RFC] package/lftp: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <7d62cc4905b9d4feab6360e98a868078a5c1bb37.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lftp has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lftp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index fb4ac13..b83a256 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LFTP
+menuconfig BR2_PACKAGE_LFTP
 	bool "lftp"
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
1.9.1
