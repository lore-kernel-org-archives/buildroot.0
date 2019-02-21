From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 14:03:47 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x series
Message-ID: <20190221130201.46E3C8151B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f45af0595675a5a86334d0be0897ade328ab86f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4bbdeec9d2a9e46041d48d14fe45dcca03bb480)
[Peter: drop 4.19.x/4.20.x, linux / hash changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 53701d40d8..05faac86fa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,12 +250,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.172"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.153"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.174"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.156"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.96"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.99"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
