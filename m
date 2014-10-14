From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:25:39 -0300
Subject: [Buildroot] [PATCH 02/16] zlib: add hash file
In-Reply-To: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329153-25453-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329153-25453-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zlib/zlib.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/zlib/zlib.hash

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
new file mode 100644
index 0000000..d6382f8
--- /dev/null
+++ b/package/zlib/zlib.hash
@@ -0,0 +1,2 @@
+# From http://www.zlib.net/
+md5	28f1205d8dd2001f26fec1e8c2cebe37	zlib-1.2.8.tar.xz
-- 
2.0.4
