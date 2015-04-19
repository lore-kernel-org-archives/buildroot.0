From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:14:03 +0200
Subject: [Buildroot] [PATCH 10/10] package/usbmount: add hash
In-Reply-To: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429463643-27125-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429463643-27125-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/usbmount/usbmount.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/usbmount/usbmount.hash

diff --git a/package/usbmount/usbmount.hash b/package/usbmount/usbmount.hash
new file mode 100644
index 0000000..4a5c7f2
--- /dev/null
+++ b/package/usbmount/usbmount.hash
@@ -0,0 +1,2 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/u/usbmount/usbmount_0.0.22.dsc
+sha256	a2b8581534b6c92f0376d202639dbc28862d3834dac64c35bde752f84975527d	usbmount_0.0.22.tar.gz
-- 
1.7.10.4
