From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 18:13:46 -0300
Subject: [Buildroot] [PATCH] rrdtool: add hash
Message-ID: <1435266826-9700-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rrdtool/rrdtool.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rrdtool/rrdtool.hash

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
new file mode 100644
index 0000000..20af75a
--- /dev/null
+++ b/package/rrdtool/rrdtool.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3190efea410a6dd035799717948b2df09910f608d72d23ee81adad4cd0184ae9	rrdtool-1.2.30.tar.gz
-- 
2.3.6
