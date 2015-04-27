From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:03 -0300
Subject: [Buildroot] [PATCH 12/16] gst-plugins-ugly: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash

diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
new file mode 100644
index 0000000..ffa0c98
--- /dev/null
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.hash
@@ -0,0 +1,2 @@
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz.md5
+md5	ba26045c8c8c91f0d48d327ccf53ac0c	gst-plugins-ugly-0.10.19.tar.xz
-- 
2.0.5
