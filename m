From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 22:11:09 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.39.x stable
	version
Message-ID: <20110710201143.C40C58A422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db52b63005b623c37975a2b42c905c3cbd7c8c1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2a5cf5c..774810f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -50,6 +50,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
-	default "2.6.39.2"	if BR2_KERNEL_HEADERS_2_6_39
+	default "2.6.39.3"	if BR2_KERNEL_HEADERS_2_6_39
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4
