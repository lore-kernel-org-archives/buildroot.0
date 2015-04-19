From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:13:56 +0200
Subject: [Buildroot] [PATCH 03/10] package/lockdev: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lockdev/lockdev.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/lockdev/lockdev.hash

diff --git a/package/lockdev/lockdev.hash b/package/lockdev/lockdev.hash
new file mode 100644
index 0000000..bb055e4
--- /dev/null
+++ b/package/lockdev/lockdev.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_1.0.3-1.6.dsc
+sha256	ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82	lockdev_1.0.3.orig.tar.gz
+sha256	a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e	lockdev_1.0.3-1.6.diff.gz
-- 
1.7.10.4
