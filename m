From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:38:36 +0200
Subject: [Buildroot] [git commit branch/next] kernel-headers: bump 3.4.x
	stable version
Message-ID: <20120802195304.86663827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=588cc81c0ab645ffa3a12d03ae0c6a056c9ab74f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 514d299..96dd129 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -68,6 +68,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.24"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.6"		if BR2_KERNEL_HEADERS_3_4
+	default "3.4.7"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
