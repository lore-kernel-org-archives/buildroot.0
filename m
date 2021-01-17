From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2021 17:46:04 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 5.{4, 10}.x 4.{4, 9, 14, 19} series
Message-ID: <20210117163233.8CCBF882D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74ce89cc21be24d24f347b2b07e2fdc26c23fc01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ef94e70295c086c8870ac0ebc175dcbe1beb73aa)
[Peter: drop 5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1f4d895639..f0d1029b95 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  4b8007c126c7146f020230fe19ce9924ba3b089c228002dea3ef54abba1824b2  linux-5.4.88.tar.xz
+sha256  268dd5177b6df1867d4ed2452ffb11a016d955c43aba5e07940886f347ab0aaf  linux-5.4.89.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  ab386137ffae217a2b681d3efa41e8a338cb2ddbd04ffb85e42a93629024a18a  linux-4.4.250.tar.xz
-sha256  9ebdbf45d83efc5ee096e98a9f0b0383ade1ad01645a25a70e6188285aff7197  linux-4.9.250.tar.xz
-sha256  f54296216ace09a1bf81efaa9dbbd4ebbe8631dbf22df9c6f286157db827391e  linux-4.14.214.tar.xz
-sha256  b98ef209321a4e39ce98ca6b8745a2268bdd927fd74e4e2c50bc68d9a637880e  linux-4.19.166.tar.xz
+sha256  0679c8c31f40a35efd63d9c7a6a73dd2496c0cae5e3a4591c57e6dce38a7b68e  linux-4.4.251.tar.xz
+sha256  ef4dcbbeb118c02c704581314832dc2a6912622946766bcede7ca3edbf1f960d  linux-4.9.251.tar.xz
+sha256  9a844e290c61b39dd23df507ba1d9c2b2b4365e5993a978b19f1eb5610b926da  linux-4.14.215.tar.xz
+sha256  312c67677c75adc4324078c5afb11411df379d5573ad0a429b3f4919f26bed01  linux-4.19.167.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0cad15067d..78a19f0c6a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -346,11 +346,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.250"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.250"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.214"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.166"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.88"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.251"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.251"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.215"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.167"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.89"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
