From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:23:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/linux-tools: fix
 kconfig coding style
Message-ID: <20190424152605.6CD1F81270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e880e269dc399f3d3f69e9e79a1d2c36e21cebec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix coding style introduced in d5edfa6eef (package/linux-tools/perf: add
dependency on 32-bit sync builtins).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3fd181bdccc270f5af6642f332ed07170dfe3ed7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 90b4825fee..1c660f76f5 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -45,8 +45,8 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
-	select BR2_PACKAGE_LINUX_TOOLS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
 	  "Performance Counters for Linux") - is a performance
