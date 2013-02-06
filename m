From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 22:38:18 +0100
Subject: [Buildroot] [git commit] toolchain/kernel-headers: not just 2.6 for
	manual version
Message-ID: <20130206214026.212E59A9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c82bc107b77aec933c414da1d3648fc5eda096bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual linux headers option may specify versions other than the 2.6
series, so drop the "2.6"

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 710dd13..38e051f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -43,7 +43,7 @@ choice
 		bool "Linux 3.7.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
-		bool "Linux 2.6 (manually specified version)"
+		bool "Manually specified Linux version"
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Local Linux snapshot (linux-2.6.tar.bz2)"
