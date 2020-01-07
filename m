From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2020 23:12:47 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/ecryptfs-utils:
 fix typo in Config.in comment
Message-ID: <20200107220309.9B51A83AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c08ba372e6f08b8648914d661650195b384c7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 39e3079b0bf1cddc83f0b0505101b62b905f0a02)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 6652d33e0e..eda884bd16 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 
 	  http://ecryptfs.org
 
-comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynami library"
+comment "ecryptfs-utils needs a toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_microblaze
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on BR2_USE_MMU
