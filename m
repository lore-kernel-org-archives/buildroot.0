From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:52 +0100
Subject: [Buildroot] [PATCH 83/84 RFC] boot/mxs-bootlets: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <4111cd7d429f364cff4e8bea916e72c5affa9f19.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mxs-bootlets has 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/mxs-bootlets/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 4bb07a0..2712d8d 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_MXS_BOOTLETS
+menuconfig BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
 	help
-- 
1.9.1
