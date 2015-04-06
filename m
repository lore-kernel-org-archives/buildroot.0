From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Mon,  6 Apr 2015 21:56:50 +0200
Subject: [Buildroot] [PATCH 1/1] libvpx : add hash
Message-ID: <1428350210-18111-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added VP8/VP9 codec names to Config.in menu help.

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/libvpx/Config.in   | 2 ++
 package/libvpx/libvpx.hash | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 package/libvpx/libvpx.hash

diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 0ed3e1a..67cc71a 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBVPX
 	help
 	  A high-quality, open video format that's freely available to
 	  everyone.
+	  libvpx contains the VP8/VP9 codecs used in applications like
+	  linphone.
 
 	  http://webmproject.org
 
diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
new file mode 100644
index 0000000..36d48f8
--- /dev/null
+++ b/package/libvpx/libvpx.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b3917c9167fc4979377fddee7f4e9378c35698dad18e23a729251c77644a2048  libvpx-v1.3.0.tar.gz
+
-- 
2.3.3
