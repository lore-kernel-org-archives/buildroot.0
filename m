From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:44 +0200
Subject: [Buildroot] [PATCH 33/83 v2] package/dnsmasq: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <cbae6c4ad638ab82dcb8c608d124e2ddbb33af06.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dnsmasq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index b4f34b8..d78c0be 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_DNSMASQ
+menuconfig BR2_PACKAGE_DNSMASQ
 	bool "dnsmasq"
 	help
 	  A lightweight DNS and DHCP server. It is intended to provide
-- 
2.7.4
