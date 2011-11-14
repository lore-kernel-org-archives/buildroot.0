From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 13:13:10 +0100
Subject: [Buildroot] [git commit] kernel-headers: update stable kernel
	version to 3.1.1
Message-ID: <20111114121532.369A58F533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da9ab19c4a87226304108d0a039cd7079c71303d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 701a02d..7ac5dad 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -58,6 +58,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.8"		if BR2_KERNEL_HEADERS_3_0
-	default "3.1"		if BR2_KERNEL_HEADERS_3_1
+	default "3.1.1"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
