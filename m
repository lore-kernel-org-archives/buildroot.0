From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:56 +0100
Subject: [Buildroot] [PATCH 06/32] package/f*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-7-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/faifa/faifa.hash                         | 1 +
 package/fastd/fastd.hash                         | 1 +
 package/fb-test-app/fb-test-app.hash             | 3 ++-
 package/fbgrab/fbgrab.hash                       | 3 ++-
 package/fbterm/fbterm.hash                       | 2 ++
 package/fbv/fbv.hash                             | 3 ++-
 package/fcgiwrap/fcgiwrap.hash                   | 3 ++-
 package/fconfig/fconfig.hash                     | 3 ++-
 package/ficl/ficl.hash                           | 1 +
 package/filemq/filemq.hash                       | 3 ++-
 package/flann/flann.hash                         | 3 ++-
 package/flashbench/flashbench.hash               | 3 ++-
 package/fluxbox/fluxbox.hash                     | 1 +
 package/fmc/fmc.hash                             | 3 ++-
 package/fmlib/fmlib.hash                         | 3 ++-
 package/fmtools/fmtools.hash                     | 4 +++-
 package/freeradius-client/freeradius-client.hash | 1 +
 package/fswebcam/fswebcam.hash                   | 3 ++-
 package/fxload/fxload.hash                       | 1 +
 19 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/package/faifa/faifa.hash b/package/faifa/faifa.hash
index 5d45e5db9d..658dae4a71 100644
--- a/package/faifa/faifa.hash
+++ b/package/faifa/faifa.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  6eada81f3d21f80b5848338b627784981064d728f8e377e5cf973d31640d4489  faifa-0.1.tar.gz
+sha256  9b62e4601b2b9cd5719a393e88ed71a8304048862502db765ed9d6ff8cf38c5e  COPYING
diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index 3c6a99e986..accdf087eb 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -2,3 +2,4 @@
 md5     e53236d3049f64f7955ad9556da099eb                                  fastd-18.tar.xz
 # computed locally
 sha256  714ff09d7bd75f79783f744f6f8c5af2fe456c8cf876feaa704c205a73e043c9  fastd-18.tar.xz
+sha256  c3095dd0adffc03eaeba9c7cd81f06962ef4797a836e49468b3dccc2802ff904  COPYRIGHT
diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
index 7f7375316c..06611db799 100644
--- a/package/fb-test-app/fb-test-app.hash
+++ b/package/fb-test-app/fb-test-app.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 6baf6b45968d0bb9a5527c6c4bf18661e9f9eb9be973a6d1952c38168c90d58f  fb-test-app-rosetta-1.1.0.tar.gz
+sha256  6baf6b45968d0bb9a5527c6c4bf18661e9f9eb9be973a6d1952c38168c90d58f  fb-test-app-rosetta-1.1.0.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index de3bc1ffd7..386d8fb5cb 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed fbgrab-1.3.tar.gz
+sha256  5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed  fbgrab-1.3.tar.gz
+sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/fbterm/fbterm.hash b/package/fbterm/fbterm.hash
index 20a3e8f083..37c32df7a4 100644
--- a/package/fbterm/fbterm.hash
+++ b/package/fbterm/fbterm.hash
@@ -1,2 +1,4 @@
 # From http://code.google.com/p/fbterm/downloads/detail?name=fbterm-1.7.0.tar.gz&can=2&q=
 sha1	dc7b7ff29212c1551f35bf7a50967454d3b8c67c	fbterm-1.7.0.tar.gz
+# locally computed
+sha256  b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/fbv/fbv.hash b/package/fbv/fbv.hash
index 892012b3d9..3f25465ba1 100644
--- a/package/fbv/fbv.hash
+++ b/package/fbv/fbv.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c	fbv-1.0b.tar.gz
+sha256  9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c  fbv-1.0b.tar.gz
+sha256  bf21d97bafcaacb5d6bc3d5502030c340f0e0593614078ab017af91e950083af  COPYING
diff --git a/package/fcgiwrap/fcgiwrap.hash b/package/fcgiwrap/fcgiwrap.hash
index 4ad8b0bb77..cf2c785c67 100644
--- a/package/fcgiwrap/fcgiwrap.hash
+++ b/package/fcgiwrap/fcgiwrap.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c72f2933669ebd21605975c5a11f26b9739e32e4f9d324fb9e1a1925e9c2ae88  fcgiwrap-99c942c90063c73734e56bacaa65f947772d9186.tar.gz
+sha256  c72f2933669ebd21605975c5a11f26b9739e32e4f9d324fb9e1a1925e9c2ae88  fcgiwrap-99c942c90063c73734e56bacaa65f947772d9186.tar.gz
+sha256  1504c301f6d417f2626085337e5c3bb3dc0282265089396ab36bfe1942feef1c  COPYING
diff --git a/package/fconfig/fconfig.hash b/package/fconfig/fconfig.hash
index eae26e2b14..98e7fbf12b 100644
--- a/package/fconfig/fconfig.hash
+++ b/package/fconfig/fconfig.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7 fconfig-20080329.tar.gz
+sha256  4ff0e8f07e35e46b705c0dbe9d9544ede01ea092a69e3f7db03e55a3f2bb8eb7  fconfig-20080329.tar.gz
+sha256  e698a9ea4d6dab0a15d3d6fd354b97b820629244f946529cc7f42b2b8e8f16d0  fconfig.c
diff --git a/package/ficl/ficl.hash b/package/ficl/ficl.hash
index 4bfbbd070a..df53c843c1 100644
--- a/package/ficl/ficl.hash
+++ b/package/ficl/ficl.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  4daf74f3d3d6f8b86ea7cb47bc24931d50b4809b50ba34ca32e0ca1e972bd3a3  ficl-4.1.0.tar.gz
+sha256  1d1dd1f1cde52e8b607c5ccb6a2e5de878fd1719b8c5a4d31b9cdb343c203d0d  ReadMe.txt
diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
index d1df1ff2a9..611d19208e 100644
--- a/package/filemq/filemq.hash
+++ b/package/filemq/filemq.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 f3764e1adacfbf7fd09fb9c553e796a80d8159f1ace689fb68307afbc1746d4c  filemq-8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0.tar.gz
+sha256  f3764e1adacfbf7fd09fb9c553e796a80d8159f1ace689fb68307afbc1746d4c  filemq-8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0.tar.gz
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  LICENSE
diff --git a/package/flann/flann.hash b/package/flann/flann.hash
index c2c41beb02..543e4b483d 100644
--- a/package/flann/flann.hash
+++ b/package/flann/flann.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b23b5f4e71139faa3bcb39e6bbcc76967fbaf308c4ee9d4f5bfbeceaa76cc5d3  flann-1.9.1.tar.gz
+sha256  b23b5f4e71139faa3bcb39e6bbcc76967fbaf308c4ee9d4f5bfbeceaa76cc5d3  flann-1.9.1.tar.gz
+sha256  3993f339cc56506c62aa1eb2fb76f240ee93b738d857832899c1e207b1dc069a  COPYING
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index a5eb388c8d..f82d7f0eed 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  12e2dcb6f041ef1a303fc5bc84642ed637c24d77ed6c667a2187f21d54555731  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/fluxbox/fluxbox.hash b/package/fluxbox/fluxbox.hash
index b18582b6c0..f59423c3d1 100644
--- a/package/fluxbox/fluxbox.hash
+++ b/package/fluxbox/fluxbox.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  fc8c75fe94c54ed5a5dd3fd4a752109f8949d6df67a48e5b11a261403c382ec0  fluxbox-1.3.7.tar.xz
+sha256  d445b8c8b3cedd8b9ebb7f450524cf658d4a199b3a89a9f2af4255cc589c6253  COPYING
diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 13d9d77ee5..d31bb5e794 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
+sha256  a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4  fmc-fsl-sdk-v2.0.tar.gz
+sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index 3746695db9..9143ac2c37 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa	fmlib-fsl-sdk-v2.0.tar.gz
+sha256  e5870756c7432b15f7a48b860625808f3c95d5f7fa5e251552eb2324ca51b0fa  fmlib-fsl-sdk-v2.0.tar.gz
+sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
diff --git a/package/fmtools/fmtools.hash b/package/fmtools/fmtools.hash
index 435cf0adc7..48f88be5fb 100644
--- a/package/fmtools/fmtools.hash
+++ b/package/fmtools/fmtools.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	75174e07d8cde6d4a8a5d7bbaa3a3b0760a850e7f6840cb7c6246227b18f5a39	fmtools-2.0.7.tar.gz
+sha256  75174e07d8cde6d4a8a5d7bbaa3a3b0760a850e7f6840cb7c6246227b18f5a39  fmtools-2.0.7.tar.gz
+# locally computed
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/freeradius-client/freeradius-client.hash b/package/freeradius-client/freeradius-client.hash
index 5931ac2b00..e343b3a4a5 100644
--- a/package/freeradius-client/freeradius-client.hash
+++ b/package/freeradius-client/freeradius-client.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  eada2861b8f4928e3ac6b5bbfe11e92cd6cdcacfce40cae1085e77c1b6add0e9  freeradius-client-1.1.7.tar.gz
+sha256  e579878de7971b2224ae2263bbc61f6c465fe40e884a9068d5fa9d17fbfd2ebe  COPYRIGHT
diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 1e75f237e7..28f604547c 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474	fswebcam-20140113.tar.xz
+sha256  444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474  fswebcam-20140113.tar.xz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fxload/fxload.hash b/package/fxload/fxload.hash
index 7febbccf1d..68a6ba8475 100644
--- a/package/fxload/fxload.hash
+++ b/package/fxload/fxload.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0cc8bfd2a7cbba2f68e0c5767477634922287943c91dd9fcf029fc8b9d577858  fxload-2008_10_13.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
-- 
2.20.1
