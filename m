From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 26 Feb 2016 08:42:05 -0300
Subject: [Buildroot] [PATCH 1/1] gstreamer: add missing plugin hash files
Message-ID: <1456486925-16824-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hash files for

  - gst-dsp
  - gst-omapfb
  - gst-plugin-x170

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gstreamer/gst-dsp/gst-dsp.hash                 | 2 ++
 package/gstreamer/gst-omapfb/gst-omapfb.hash           | 2 ++
 package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash | 2 ++
 3 files changed, 6 insertions(+)
 create mode 100644 package/gstreamer/gst-dsp/gst-dsp.hash
 create mode 100644 package/gstreamer/gst-omapfb/gst-omapfb.hash
 create mode 100644 package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash

diff --git a/package/gstreamer/gst-dsp/gst-dsp.hash b/package/gstreamer/gst-dsp/gst-dsp.hash
new file mode 100644
index 0000000..3bccfc1
--- /dev/null
+++ b/package/gstreamer/gst-dsp/gst-dsp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 45437a038979916de74e78a2cc7a0b01ba3982d0848e1e483a054c9cf0ce5883  gst-dsp-v0.10.2.tar.gz
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.hash b/package/gstreamer/gst-omapfb/gst-omapfb.hash
new file mode 100644
index 0000000..7d1c722
--- /dev/null
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 56c719584d7a7ede5fc2053e8d1060f623b226a60672de0faba46fad646658a4  gst-omapfb-v1.0.tar.gz
diff --git a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
new file mode 100644
index 0000000..527c461
--- /dev/null
+++ b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 734ded3618246d946b53c2c8c7ab5a0961287485aaef5fb9bf874f93e3caa342  gst-plugin-x170-1.0.tar.gz
-- 
2.5.0
