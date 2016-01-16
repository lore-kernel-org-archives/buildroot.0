From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:26 +0100
Subject: [Buildroot] [PATCH 34/80 v1] package/connman: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <875b5ce01ee34f017e8f171f98f3e5ef0aaf5034.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

connman has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 655db86..2434385 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_CONNMAN
+menuconfig BR2_PACKAGE_CONNMAN
 	bool "connman"
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-- 
1.9.1
