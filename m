From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Dec 2014 21:40:40 -0300
Subject: [Buildroot] [PATCH] usbutils: drop double needs from comment
Message-ID: <1418172040-18323-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 7920ab8..923853a 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs needs udev /dev management and toolchain w/ threads"
+comment "usbutils needs udev /dev management and toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
-- 
2.0.4
