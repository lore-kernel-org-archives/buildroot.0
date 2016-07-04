From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:14 +0200
Subject: [Buildroot] [PATCH 63/83 v2] package/openobex: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <ba70a53024e80b14d4c5a143374e99ed0d133f1d.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openobex has 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openobex/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index ed1b81f..bd965d4 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENOBEX
+menuconfig BR2_PACKAGE_OPENOBEX
 	bool "openobex"
 	help
 	  Free open source implementation of the Object Exchange (OBEX)
-- 
2.7.4
