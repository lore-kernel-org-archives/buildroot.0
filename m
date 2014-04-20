From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:04:18 +0200
Subject: [Buildroot] [git commit] linux-headers: remove obsolete Config.in
	help paragraph
Message-ID: <20140420090540.0E4D09C8E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0df19d2e5efd263c9d23f6df691b7a4cf8dd6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 971e331c54e08e82b4ed28a4eca8305933fa1cb0
('package/linux-headers: remove 2.6 snapshot'), we removed the support
for the Linux headers snapshot option, but we forgot to remove some
related help text in the main Config.in option of the Linux headers
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c735b3..23586fb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -11,9 +11,6 @@ choice
 	  You must select the correct set of header files to match
 	  the kernel you intend to use on your target system.
 
-	  For the snapshot, you have to provide the
-	  linux-2.6.tar.bz2 tarball in your download dir.
-
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
 		depends on !BR2_arc
