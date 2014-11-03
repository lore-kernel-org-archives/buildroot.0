From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  3 Nov 2014 20:18:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/clamav: add hash
Message-ID: <1415042309-22291-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/clamav/clamav.hash

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
new file mode 100644
index 0000000..4f21a50
--- /dev/null
+++ b/package/clamav/clamav.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/clamav/files/clamav/0.98.4/
+sha1	f1003d04f34efb0aede05395d3c7cc22c944e4ef	clamav-0.98.4.tar.gz
-- 
1.7.10.4
