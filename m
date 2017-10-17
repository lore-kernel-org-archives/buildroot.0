From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:53:06 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] docs/manual: fix
	BR2_EXTERNAL path typo
Message-ID: <20171017090327.0766D7FDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a729e4d99d7155b44a8f15caa5b491fb60906e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Signed-off-by: Cam Hutchison <camh@xdna.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0c76d89e54705a477cedad5dc39b668af771be7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index ea0e120..b1eed32 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -199,7 +199,7 @@ and to the kernel configuration file as follows (e.g. by running
 ----
 BR2_GLOBAL_PATCH_DIR=$(BR2_EXTERNAL_BAR_42_PATH)/patches/
 BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_FOO)/board/<boardname>/kernel.config
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/kernel.config
 ----
 
 ===== Example layout
@@ -263,7 +263,7 @@ illustration, of course):
   |     |BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BAR_42_PATH)/patches/"
   |     |BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/overlay/"
   |     |BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/post-image.sh"
-  |     |BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_BAR_42_FOO)/board/my-board/kernel.config"
+  |     |BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/kernel.config"
   |     `----
   |
   |- patches/linux/0001-some-change.patch
