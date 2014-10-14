From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:29:41 -0300
Subject: [Buildroot] [PATCH 1/2] bzip2: add hash file
Message-ID: <1413329382-25575-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bzip2/bzip2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/bzip2/bzip2.hash

diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
new file mode 100644
index 0000000..60b0a19
--- /dev/null
+++ b/package/bzip2/bzip2.hash
@@ -0,0 +1,2 @@
+# From http://www.bzip.org/downloads.html
+md5	00b516f4704d4a7cb50a1d97e6e8e15b	bzip2-1.0.6.tar.gz
-- 
2.0.4
