From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:16 -0300
Subject: [Buildroot] [PATCH 25/40] libreplaygain: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libreplaygain/libreplaygain.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/libreplaygain/libreplaygain.hash

diff --git a/package/libreplaygain/libreplaygain.hash b/package/libreplaygain/libreplaygain.hash
new file mode 100644
index 0000000..7a61098
--- /dev/null
+++ b/package/libreplaygain/libreplaygain.hash
@@ -0,0 +1,4 @@
+# From https://www.musepack.net/index.php?pg=src
+md5	e27b3b1249b7fbae92d656d9e3d26633	libreplaygain_r475.tar.gz
+# Calculated based on the hash above
+sha256	8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482	libreplaygain_r475.tar.gz
-- 
2.3.6
