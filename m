From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:43 +0200
Subject: [Buildroot] [PATCH 32/83 v2] package/directfb: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <8f77a8860c65fd4871460bcffcb661c94c2718df.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

directfb has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/directfb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f0bcaaa..e842594 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DIRECTFB
+menuconfig BR2_PACKAGE_DIRECTFB
 	bool "directfb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-- 
2.7.4
