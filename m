From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:07:56 +0200
Subject: [Buildroot] [git commit] linux: fix comment about version choice
Message-ID: <20160816062550.1438F7FEA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc3f8bc16556f5d40ef006539cca7c3ba1300c7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
