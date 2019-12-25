From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 18:07:54 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{3, 4}.x series
Message-ID: <20191225165856.1F5AC8E356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b38c13760a0c555d9ef188db3fb93d7dbc80c5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ce0f527950b4d698de4f3f36276ec14cd49e1b89)
[Peter: drop 5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c5a3f9eda7..ec7e08684d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.88" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.90" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9e5dc6a019..8d1c69b493 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,5 +2,5 @@
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
 sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4.4.206.tar.xz
 sha256 1df27899a9bc4dd874f3830ab9e7b638f0026dffd67a2e230444e5d2805ccad6  linux-4.9.206.tar.xz
-sha256 0d49ec72e273f6fc7462ad56849b2285f13fd5f4185e8f932a0074fc2eca1bb3  linux-4.14.158.tar.xz
-sha256 c1923b6bd166e6dd07be860c15f59e8273aaa8692bc2a1fce1d31b826b9b3fbe  linux-4.19.88.tar.xz
+sha256 e8d42d3a1b85d180141e9bc11c4a0e87f8a413c0e989b0f24c1b7c40f8a826f2  linux-4.14.159.tar.xz
+sha256 29d86c0a6daf169ec0b4b42a12f8d55dc894c52bd901f876f52a05906a5cf7fd  linux-4.19.90.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 17a27075c2..580d3bc6b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -289,8 +289,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.206"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.206"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.158"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.88"	if BR2_KERNEL_HEADERS_4_19
+	default "4.14.159"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.90"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
