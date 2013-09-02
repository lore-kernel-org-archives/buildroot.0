From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:58 +0200
Subject: [Buildroot] [PATCH 9 of 9 v4] linux: mention 3.x.y kernels in
 'custom version' help
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <f46382b15981b2489c2d.1378152478@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(also fix grammatical error versions -> version)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: no changes
v3: no changes
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
