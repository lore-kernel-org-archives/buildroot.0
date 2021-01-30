From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 16:35:46 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10}.x series
Message-ID: <20210130152115.B88A87FD87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bf6d795e24fabf6f271b18fd9fed6150b699504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1c61297ec0fa4a1fbdb4507216b1da46a3b6909b)
[Peter: drop 5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 5e03228e34..c18240d8b3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  b0d7abae88e5f91893627c645e680a95c818defd1b4fcaf3e2afb4b2b6b4ab86  linux-5.9.16.tar.xz
 sha256  4ab4a3f694b7b4cfbe78871eab34c8039ad33692144c45c669827a594da85534  linux-5.8.18.tar.xz
-sha256  c0937ff98824c4b14cfea68a04340e0beb3c00f1cc02984daf2f3bdf542394fd  linux-5.4.92.tar.xz
+sha256  d37449403664cc3b1bac96d0d9a199dbe619885cd899c0ae3108843f42e3d522  linux-5.4.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  661e98b9448cbac948c705fd44cd7d30200422ee1cb02950d142aa99a1b3985a  linux-4.4.253.tar.xz
 sha256  9a5b51a8350201bd38e3ff13909323a6571b4572a7b3caed76e462b07619bc18  linux-4.9.253.tar.xz
 sha256  62a36a25431016d98d0f1cff98be432086c51f86fd79042bd10a867b3a924d11  linux-4.14.217.tar.xz
-sha256  dd0d0264f8ef4363d0080054fd344470a73f07aca2cd673e91bf6e77fbe25b4a  linux-4.19.170.tar.xz
+sha256  f4e352fe0eb986e5b532b99d9b0725a67046cbb3e5f53fcd5b098cbaeb2ac60a  linux-4.19.171.tar.xz
 # Locally computed
 sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  bc1dacd3d0f526de3e8754a444e8e02a54521527af639ddb907cb35cda775a8c  linux-cip-4.19.152-cip37-rt16.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3d24001f4a..935b222265 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -349,8 +349,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.253"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.253"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.217"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.170"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.92"	if BR2_KERNEL_HEADERS_5_4
+	default "4.19.171"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.93"	if BR2_KERNEL_HEADERS_5_4
 	default "5.8.18"	if BR2_KERNEL_HEADERS_5_8
 	default "5.9.16"	if BR2_KERNEL_HEADERS_5_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
