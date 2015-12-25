From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:15 +0100
Subject: [Buildroot] [PATCH 46/84 RFC] package/directfb: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <1b63f13fc3066aa397dedf17e729b031497ce113.1451076704.git.yann.morin.1998@free.fr>
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
