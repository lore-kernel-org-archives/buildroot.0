From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:36 +0100
Subject: [Buildroot] [PATCH 67/84 RFC] package/dnsmasq: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <635f0a8b2aa79d31b178b85c8d2201285cb0daaf.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dnsmasq has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.9.1
