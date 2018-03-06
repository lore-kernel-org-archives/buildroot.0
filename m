From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:28:32 +0100
Subject: [Buildroot] [git commit] configs/imx6-sabresd: needs host-openssl
 for the Linux kernel build
Message-ID: <20180306143236.07FC97FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5dac3b9b8d72ea2b4aa264bfaa54e41f32595009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306836

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6-sabresd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index edb4d7ed10..9999513914 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -36,3 +36,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
