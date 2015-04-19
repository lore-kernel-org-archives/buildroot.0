From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:14:00 +0200
Subject: [Buildroot] [PATCH 07/10] package/setserial: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/setserial/setserial.hash |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/setserial/setserial.hash

diff --git a/package/setserial/setserial.hash b/package/setserial/setserial.hash
new file mode 100644
index 0000000..ce3b369
--- /dev/null
+++ b/package/setserial/setserial.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial/setserial_2.17-45.3.dsc
+sha256	7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a	setserial_2.17.orig.tar.gz
+sha256	33db87e8a86cf12b7c97efca9e056865e71358e8cfeb3931118b2647ce1eecc6	setserial_2.17-45.3.diff.gz
-- 
1.7.10.4
