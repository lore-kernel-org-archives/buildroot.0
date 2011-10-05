From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 11:05:44 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: fix bzip2 typo
Message-ID: <20111005090603.BEBB88E243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b19842c678e3edb6413906f5d3c72abf5414be9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index bebff40..20aad76 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -458,7 +458,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-bz2
-GST_PLUGINS_BAD_DEPENDENCIES += bz2ip
+GST_PLUGINS_BAD_DEPENDENCIES += bzip2
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-bz2
 endif
