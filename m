From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:00 +0200
Subject: [Buildroot] [PATCH 49/83 v2] package/lftp: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <0282a1a2affd54dba70fbbd57cb99695f95a1a58.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lftp has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
2.7.4
