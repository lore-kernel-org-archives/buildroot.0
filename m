From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:02 -0300
Subject: [Buildroot] [PATCH 11/16] gst-plugins-good: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer/gst-plugins-good/gst-plugins-good.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gstreamer/gst-plugins-good/gst-plugins-good.hash

diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.hash b/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
new file mode 100644
index 0000000..094dc87
--- /dev/null
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.hash
@@ -0,0 +1,2 @@
+# From http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-0.10.31.tar.xz.md5
+md5	555845ceab722e517040bab57f9ace95	gst-plugins-good-0.10.31.tar.xz
-- 
2.0.5
