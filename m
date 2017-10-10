From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 10 Oct 2017 11:12:40 +0200
Subject: [Buildroot] [PATCH][2017.08.x] Update github hashes
Message-ID: <20171010091240.7611-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on Bernd patch (commit 4fbc0c9b) which is available on master
branch.

The kernel-module-imx-gpu-viv and rpi-userland packages are actually
broken on 2017.08 so this is a partial backport Bernd patch.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Sorry to come back again about this issue but would it be possible to
create a 2017.08.x branch with this patch? I don't necessarily need a
2017.08.1 tag but at least a branch that builds.

The reason is that I made a blog post about the latest features of
Buildroot[1]. Since then, the Github hashes changed and many customers
complain that my build instructions don't work.

Hope that creating such branch would be possible.

Regards,
Gary

[1] https://boundarydevices.com/buildroot-2017-08-imx-platforms
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 package/rpi-userland/rpi-userland.hash                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index f9d400459e..f2e787ca25 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	0d45472a967d747bc1948b0332f77c8cd9f6ec1620b0922e82ca5ddd053b40ea  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
+sha256	f18b826fd25328adf6b4405f48fdf0eaaddc77bb79c0dee76cd8c28aa8ffc078  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 1728ae8712..e8a78b95fa 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 476cde13d0d4bbf44ffc4d1d545847464d5c270bb72e4d940e43e5972c4de9da rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
+sha256 46a37eaf0de598ce5804e48a5efc2120e07d753a57ed83463ebfa551562eefe6 rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
-- 
2.14.1
