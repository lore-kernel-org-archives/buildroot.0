From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 17:32:55 +0200
Subject: [Buildroot] [PATCH] linux: fix comment about version choice
Message-ID: <1471188775-9849-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e02d138..306d077 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -18,10 +18,9 @@ config BR2_LINUX_NEEDS_MODULES
 # Version selection. We provide the choice between:
 #
 #  1. A single fairly recent stable kernel version
-#  2. In case an internal toolchain has been built, the same kernel
-#     version as the kernel headers
-#  3. A custom stable version
-#  4. A custom tarball
+#  2. A custom stable version
+#  3. A custom tarball
+#  4. A set of custom repository locations
 #
 choice
 	prompt "Kernel version"
-- 
2.7.4
