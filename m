From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Jul 2010 23:50:27 +0200
Subject: [Buildroot] [git commit master 1/1] linux: bump 2.6.34.x version
Message-ID: <20100729215231.C3C0C83697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9d42e194760c8872e787d8920043e42e38b6ac88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 948d713..3909f89 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.34" if BR2_LINUX_KERNEL_2_6_34
+	default "2.6.34.1" if BR2_LINUX_KERNEL_2_6_34
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.1
