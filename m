From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Jul 2010 21:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] linux: fix
	BR2_LINUX_KERNEL_DEFCONFIG help text
Message-ID: <20100718200735.D1C9582BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=95a14f57bf8d84d7ba5b4e769b1c0f565dd713e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Trailing _defconfig, not leading.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d8a5157..948d713 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -96,7 +96,7 @@ config BR2_LINUX_KERNEL_DEFCONFIG
 	string "Defconfig name"
 	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
 	help
-	 Name of the defconfig file to use, without the leading
+	 Name of the defconfig file to use, without the trailing
 	 _defconfig
 
 config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
-- 
1.7.1
