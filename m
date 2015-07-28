From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:52 -0300
Subject: [Buildroot] [PATCH 051/113] lrzsz: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-51-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lrzsz/lrzsz.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lrzsz/lrzsz.hash

diff --git a/package/lrzsz/lrzsz.hash b/package/lrzsz/lrzsz.hash
new file mode 100644
index 0000000..932832d
--- /dev/null
+++ b/package/lrzsz/lrzsz.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1	lrzsz-0.12.20.tar.gz
-- 
2.3.6
