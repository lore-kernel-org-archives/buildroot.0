From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2020 23:10:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/ecryptfs-utils:
 fix typo in Config.in comment
Message-ID: <20200107220141.91271839D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0546e05853437dc5d9d06203c7448c0852975b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 39e3079b0bf1cddc83f0b0505101b62b905f0a02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 68a659d33d..0c39f48d08 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
