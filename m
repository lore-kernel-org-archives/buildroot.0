From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Jan 2013 22:13:42 +0100
Subject: [Buildroot] [git commit] kernel-headers: bmp 3.2.x stable version
Message-ID: <20130104214902.80C8A9A619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af75ef1fabca7a8918f02d62b6427ec0f51f1e54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a8a8a2b..4f7a6d9 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,7 +60,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.57"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.35"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.36"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.24"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
