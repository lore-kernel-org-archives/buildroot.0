From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 09:29:24 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{1,
 4, 9, 14}.x series
Message-ID: <20171231083606.17906838FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a95aa0ee5ed27fab3dbb2d87f8d1256d3e6c7b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 634bdbd52e7451b615b8972f0d3973e5b76ef987)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f50a996..6c64a63 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,8 +221,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.48"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.107"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.71"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.72"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
