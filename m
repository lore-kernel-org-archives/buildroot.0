From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Apr 2013 11:47:09 +0200
Subject: [Buildroot] [git commit] linux: bump 3.8.x stable version
Message-ID: <20130410095124.78F149B53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c461e64201598eae85ff32e130ed3f0ccd9fed78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index df718c3..8208277 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_3_8
-	bool "3.8.5"
+	bool "3.8.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
