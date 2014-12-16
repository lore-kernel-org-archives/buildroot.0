From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Dec 2014 09:41:12 -0300
Subject: [Buildroot] [PATCH 1/2] apr: add hash file
Message-ID: <1418733673-12637-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/apr/apr.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/apr/apr.hash

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
new file mode 100644
index 0000000..50d657a
--- /dev/null
+++ b/package/apr/apr.hash
@@ -0,0 +1,2 @@
+# From http://archive.apache.org/dist/apr/apr-1.5.1.tar.gz.sha1
+sha1	9caa83e3f50f3abc9fab7c4a3f2739a12b14c3a3	apr-1.5.1.tar.gz
-- 
2.0.4
