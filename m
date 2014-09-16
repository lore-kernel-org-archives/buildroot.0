From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 23:05:12 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix sndfile comment
Message-ID: <20140916210716.224D29D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0112fcfa8c804a0ba596462cb9b6d6b3e84b7d20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is not called gst-plugins-bad, and the other comments in the
file are of the "foo plugin needs a toolchain w/.." form, so use that for
sndfile as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index fd37dc7..9cb275d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -479,7 +479,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	select BR2_PACKAGE_LIBSNDFILE
 	depends on BR2_LARGEFILE
 
-comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
+comment "sndfile plugin needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
