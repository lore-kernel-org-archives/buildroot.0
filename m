From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:49:58 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: fix typo in variable
	name
Message-ID: <20170207090318.BB3C17FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=040f58ae309432542d3a8532b59ad3800fb85ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2f68919..2f68145 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -95,7 +95,7 @@ endif
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
-GST1_PLUGINS_ULGY_HAS_GPL_LICENSE = y
+GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
 endif
