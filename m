From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 09:23:03 +0200
Subject: [Buildroot] [PATCH 6 of 6 v2] linux: mention 3.x.y kernels in
 'custom version' help
In-Reply-To: <patchbomb.1374650577@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
Message-ID: <552e9f29dfd4c8d33b36.1374650583@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(also fix grammatical error versions -> version)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
(v2): new patch in series, although only loosely related.

 linux/Config.in |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -37,8 +37,8 @@ config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
 	help
-	  This option allows to use a specific 2.6.x or 2.6.x.y
-	  official versions, as available on kernel.org
+	  This option allows to use a specific official version from
+	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	bool "Custom tarball"
