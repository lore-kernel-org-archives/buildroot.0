From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:41 +0200
Subject: [Buildroot] [PATCH 30/83 v2] package/connman: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <14540b2e3f1b3dacbe37cec60d877eedb2931f57.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

connman has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index f723a31..23adf85 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_CONNMAN
+menuconfig BR2_PACKAGE_CONNMAN
 	bool "connman"
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-- 
2.7.4
