From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:04 -0300
Subject: [Buildroot] [PATCH 13/16] gstreamer: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer/gstreamer/gstreamer.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gstreamer/gstreamer/gstreamer.hash

diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
new file mode 100644
index 0000000..e652eae
--- /dev/null
+++ b/package/gstreamer/gstreamer/gstreamer.hash
@@ -0,0 +1,2 @@
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz.md5
+md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
-- 
2.0.5
