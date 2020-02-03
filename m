From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:35 +0100
Subject: [Buildroot] [git commit] package/k*: add license file hashes
Message-ID: <20200203133729.C687088723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335f3d5ff9b8ef7ecb4a8f1e42d303a9fc81d072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash           | 3 ++-
 package/kbd/kbd.hash                                                   | 3 ++-
 package/kexec-lite/kexec-lite.hash                                     | 3 ++-
 package/kismet/kismet.hash                                             | 3 ++-
 package/kmsxx/kmsxx.hash                                               | 1 +
 package/knock/knock.hash                                               | 3 ++-
 package/kvm-unit-tests/kvm-unit-tests.hash                             | 3 ++-
 package/kvmtool/kvmtool.hash                                           | 3 ++-
 8 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 3ed7ca2dd9..19341db6ba 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256	ad910b7d36dc433bbbe85808d278312e9199635aaa5d00097b70ffab11bde9e6  kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8.tar.gz
+sha256  ad910b7d36dc433bbbe85808d278312e9199635aaa5d00097b70ffab11bde9e6  kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8.tar.gz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index 3fed6ace0e..cf29c59860 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,2 +1,3 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256 5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88  kbd-2.0.4.tar.xz
+sha256  5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88  kbd-2.0.4.tar.xz
+sha256  8682bd7a7fe88bad31bf94ee9795c73fd4bc27bfcd50fb135f36dd8762c52035  COPYING
diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index 91e39d68ee..01008236a7 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 6eb115c8db3a071b970d7ba985ea5e2425e1e716952186f9a4fe329a2e2bb1ca kexec-lite-18ec88310c4134eca2f9e3c417cd09f5914bf633.tar.gz
+sha256  6eb115c8db3a071b970d7ba985ea5e2425e1e716952186f9a4fe329a2e2bb1ca  kexec-lite-18ec88310c4134eca2f9e3c417cd09f5914bf633.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 913dffc9dd..30780b1cc3 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 bdb21f153311f1ff3b16621bf0d6740f66369bf0982b0a289c9a12af8847e237  kismet-2016-07-R1.tar.xz
+sha256  bdb21f153311f1ff3b16621bf0d6740f66369bf0982b0a289c9a12af8847e237  kismet-2016-07-R1.tar.xz
+sha256  92b9eae679d8efbcd7514f7ff1346e4c1d42d272cd10bcb724d1511d35e28cd1  debian/copyright
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index 94a9ea1eaa..b8d06ac478 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  28892e50c1d1c83fddff9ec683e3bdbd465f5032d0014ceeab43563b813807e1  kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9.tar.gz
+sha256  022b4d51da34a380d74dc24eea8e2c4e1a4c8776a52171f8d9e941cf56daf888  LICENSE
diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index 3599e43da2..0b9a0918fc 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256	940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58	knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
+sha256  940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58  knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
+sha256  d747e19206e41702e40822dd91d37cbf40edd86f364ea416d667a0e3013f7189  COPYING
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index bb827de939..3458778937 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
+sha256  346c543de9e953db283072e1c591cab9d0eb775f7fb1fff3d7560f38bdf6bdf2  kvm-unit-tests-kvm-unit-tests-20171020.tar.gz
+sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index 428277354d..fd841c354c 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
+sha256  2d55e4521ac040b870db015e1f075d69b89f940242d7ce5708f7d7060d62c0cc  kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e.tar.gz
+sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
