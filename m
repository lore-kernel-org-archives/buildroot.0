From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:29 +0200
Subject: [Buildroot] [PATCH 10/19] package/htop: add hash
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/htop/htop.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/htop/htop.hash

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
new file mode 100644
index 0000000..41d5a2e
--- /dev/null
+++ b/package/htop/htop.hash
@@ -0,0 +1,2 @@
+# From http://www.freelists.org/post/htop/ANN-htop-103
+md5	e768b9b55c033d9c1dffda72db3a6ac7	htop-1.0.3.tar.gz
-- 
1.7.10.4
