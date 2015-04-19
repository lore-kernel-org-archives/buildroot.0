From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:42:31 +0200
Subject: [Buildroot] [PATCH 5/5] package/libcuefile: add hash
In-Reply-To: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429458151-20049-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcuefile/libcuefile.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcuefile/libcuefile.hash

diff --git a/package/libcuefile/libcuefile.hash b/package/libcuefile/libcuefile.hash
new file mode 100644
index 0000000..0f500cb
--- /dev/null
+++ b/package/libcuefile/libcuefile.hash
@@ -0,0 +1,2 @@
+# From https://www.musepack.net/index.php?pg=src
+md5	1a6ac52e1080fd54f0f59372345f1e4e	libcuefile_r475.tar.gz
-- 
1.7.10.4
