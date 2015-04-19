From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:53:40 +0200
Subject: [Buildroot] [PATCH 4/5] package/classpath: add hash
In-Reply-To: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429440821-2578-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429440821-2578-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/classpath/classpath.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/classpath/classpath.hash

diff --git a/package/classpath/classpath.hash b/package/classpath/classpath.hash
new file mode 100644
index 0000000..25d3e8c
--- /dev/null
+++ b/package/classpath/classpath.hash
@@ -0,0 +1,2 @@
+# From http://www.gnu.org/software/classpath/announce/20090205.html
+sha1	1d6e8d1b3542a35bbd1013c61fab3cfae083decb	classpath-0.98.tar.gz
-- 
1.7.10.4
