From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:38 -0300
Subject: [Buildroot] [PATCH 01/16] uclibc: add hash file
Message-ID: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/uclibc/uclibc.hash

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
new file mode 100644
index 0000000..0fba41a
--- /dev/null
+++ b/package/uclibc/uclibc.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking pgp signature (vanilla)
+# Locally calculated (ARC)
+sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
+sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
-- 
2.0.4
