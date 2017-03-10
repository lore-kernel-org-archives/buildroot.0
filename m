From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Mar 2017 10:30:55 +0200
Subject: [Buildroot] [PATCH 2/2] netsniff-ng: add homepage link
In-Reply-To: <65617ee3af4d36e520b84b77e643007e5c20e790.1489134655.git.baruch@tkos.co.il>
References: <65617ee3af4d36e520b84b77e643007e5c20e790.1489134655.git.baruch@tkos.co.il>
Message-ID: <780397d0b5e413e3dfc27f56b4adf613e8081489.1489134655.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/netsniff-ng/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 00617e371921..b59c876a9927 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
+	  http://netsniff-ng.org
+
 comment "netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
-- 
2.11.0
