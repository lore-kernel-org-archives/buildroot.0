From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:49 +0100
Subject: [Buildroot] [PATCH 80/84 RFC] boot/at91bootstrap3: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <6e4ec02d3d97c4d6e87aaf93f2abbcdabd3d91e8.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at91bootstrap3 has more than 5 options, so use a 'menuconfig' to
group the options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index b8ebe80..6f4050c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,4 +1,4 @@
-config BR2_TARGET_AT91BOOTSTRAP3
+menuconfig BR2_TARGET_AT91BOOTSTRAP3
 	depends on BR2_arm926t || BR2_cortex_a5
 	bool "AT91 Bootstrap 3"
 	help
-- 
1.9.1
