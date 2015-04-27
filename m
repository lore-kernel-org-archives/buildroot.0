From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:59 -0300
Subject: [Buildroot] [PATCH 08/16] gst-ffmpeg: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
new file mode 100644
index 0000000..5f7f35d
--- /dev/null
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.hash
@@ -0,0 +1,2 @@
+# From http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-0.10.13.tar.bz2.md5
+md5	7f5beacaf1312db2db30a026b36888c4	gst-ffmpeg-0.10.13.tar.bz2
-- 
2.0.5
