From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:20:12 +0200
Subject: [Buildroot] [git commit] rtl8188eu: fix help text format
Message-ID: <20170530212121.9F2147FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd7415e244ef9469d4b54b8d41d4a8b54e58e5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8188eu/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 09cde24..9263802 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,14 +4,14 @@ config BR2_PACKAGE_RTL8188EU
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
 	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a similar
-	  codebase.
+	  Since 3.12, there is a (staging) driver in mainline, with a
+	  similar codebase.
 
-	  Make sure your target kernel has the CONFIG_WIRELESS_EXT config
-	  option enabled.
+	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
+	  config option enabled.
 
-	  Note: this package needs a firmware loading mechanism to load the
-	  binary blob for the chip to work.
+	  Note: this package needs a firmware loading mechanism to load
+	  the binary blob for the chip to work.
 
 	  https://github.com/lwfinger/rtl8188eu
 
