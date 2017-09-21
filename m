From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 11:33:40 +0200
Subject: [Buildroot] [git commit] Update github hashes
Message-ID: <20170921092808.EA20E8075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fbc0c9b53a1652bebd467dfdd9862952208ce6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems github now sometimes provides slightly changed tarballs which
produce a different sha256 hash than before. This commit fixes the
hashes of the packages when sources.buildroot.net does not store a copy
of the tarball matching the current hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash        | 2 +-
 package/kodi/kodi.hash                                                  | 2 +-
 package/rpi-userland/rpi-userland.hash                                  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index f9d4004..f2e787c 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	0d45472a967d747bc1948b0332f77c8cd9f6ec1620b0922e82ca5ddd053b40ea  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
+sha256	f18b826fd25328adf6b4405f48fdf0eaaddc77bb79c0dee76cd8c28aa8ffc078  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index c7de62a..df717ef 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4691ac8bde78b5abb2847cf6ad64d36141c0582f944ba435eafe7702cc2d1187  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
+sha256 764941d87aa99408c48d91b5ddf237cd0251fb4cbafba3da188bb4a965220309  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 6c7cf8f..0dc4613 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 b05e11b2d108222bfc3ff0c9a466d798c0feedf1228166239948e6ed37c3cb4f  kodi-17.4-Krypton.tar.gz
+sha256 6b0886e7449fc201e0ec0584b37f9f654c429797a41e6d0b6a4b5a7fd5ec34dc  kodi-17.4-Krypton.tar.gz
 # Locally computed - libdvdcss
 sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
 # Locally computed - libdvdnav
diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 1728ae8..e8a78b9 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 476cde13d0d4bbf44ffc4d1d545847464d5c270bb72e4d940e43e5972c4de9da rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
+sha256 46a37eaf0de598ce5804e48a5efc2120e07d753a57ed83463ebfa551562eefe6 rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
