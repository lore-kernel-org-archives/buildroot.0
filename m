From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:28 +0100
Subject: [Buildroot] [PATCH 36/80 v1] package/directfb: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <87406d3ed5f1083e01e0479338ac3f02fc950aba.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

directfb has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/directfb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 73425d3..6a233dc 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DIRECTFB
+menuconfig BR2_PACKAGE_DIRECTFB
 	bool "directfb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
1.9.1
