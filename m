From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 19:28:53 -0300
Subject: [Buildroot] [PATCH] pixman: add hash file
Message-ID: <1427754533-4907-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pixman/pixman.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pixman/pixman.hash

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
new file mode 100644
index 0000000..c6ec14e
--- /dev/null
+++ b/package/pixman/pixman.hash
@@ -0,0 +1,2 @@
+# From http://cairographics.org/releases/pixman-0.32.6.tar.gz.sha1
+sha1	8791343cbf6d99451f4d08e8209d6ac11bf96df2	pixman-0.32.6.tar.gz
-- 
2.0.5
