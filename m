From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:14:56 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate for proper
 defconfig ordering
Message-ID: <20181216151105.D2F058B3C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42e51d37357f39570a832e0eecb9131f7f159e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d3ac5026da..f393cbbdfb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -189,8 +189,8 @@ olimex_a20_olinuxino_micro_defconfig: *defconfig
 olimex_a64_olinuxino_defconfig: *defconfig
 olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
-orangepi_lite_defconfig: *defconfig
 orangepi_lite2_defconfig: *defconfig
+orangepi_lite_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_one_plus_defconfig: *defconfig
 orangepi_pc2_defconfig: *defconfig
