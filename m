From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 11:40:31 +0200
Subject: [Buildroot] [git commit] libv4l: update v4l-utils help text (add
	more listed tools)
Message-ID: <20151010094614.99513818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9efc0817f1445aceb837863dc251f7600b033275
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/Config.in |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index d137613..5a55b2b 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -26,8 +26,16 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	help
 	  v4l-utils is a collection of various video4linux and DVB utilities.
 	  Enable this if you want to build the following tools:
-	  cx18-ctl, ir-keytable, ivtv-ctl, v4l2-ctl, v4l2-sysfs-path and
-	  others.
+	  - cx18-ctl
+	  - dvb-fe-tool, dvbv5-zap, dvbv5-scan, dvb-format-convert
+	  - decode_tm6000
+	  - ir-keytable
+	  - media-ctl
+	  - v4l2-compliance
+	  - v4l2-ctl, cx18-ctl, ivtv-ctl
+	  - v4l2-sysfs-path
+	  - rds-ctl
+	  - qv4l2 (if Qt is enabled)
 
 endif
 
