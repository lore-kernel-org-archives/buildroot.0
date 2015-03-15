From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 15 Mar 2015 13:52:52 +0100
Subject: [Buildroot] [PATCH] bluez_utils: Add hash file
Message-ID: <550580A4.7040803@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/bluez_utils/bluez_utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bluez_utils/bluez_utils.hash

diff --git a/package/bluez_utils/bluez_utils.hash b/package/bluez_utils/bluez_utils.hash
new file mode 100644
index 0000000..09b7b21
--- /dev/null
+++ b/package/bluez_utils/bluez_utils.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
+sha256	41f9578bef39b8c94a2d6ddeaa556afd22d136936d0f03100e422fe970a45a7d  bluez-4.101.tar.xz
-- 
1.9.1
