From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:33 +0100
Subject: [Buildroot] [PATCH 41/80 v1] package/efl: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <210a5d832d2d392bd592cc19a07944bf5d1e002d.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EFL has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index fd3498e..f93c1c1 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_EFL
+menuconfig BR2_PACKAGE_EFL
 	bool "efl"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
-- 
1.9.1
