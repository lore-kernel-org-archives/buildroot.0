From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:45 -0300
Subject: [Buildroot] [PATCH 08/16] usbutils: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/usbutils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/usbutils/usbutils.hash

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
new file mode 100644
index 0000000..6023f39
--- /dev/null
+++ b/package/usbutils/usbutils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
+sha256	7593a01724bbc0fd9fe48e62bc721ceb61c76654f1d7b231b3c65f6dfbbaefa4	usbutils-007.tar.xz
-- 
2.0.4
