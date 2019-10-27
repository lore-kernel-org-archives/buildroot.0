From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:35:06 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: get
 rid of remnants of using := in LICENSE
Message-ID: <20191027092901.779B288C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c17718f57aadce8d87c24e25ee932750e188c0e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no longer any reason to assign to LICENSE using an
immediate assignment. There was even no reason to use it
either in the first assignment.

Drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 59eb332e57..856db88e49 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 # Additional plugin licenses will be appended to GST1_PLUGINS_BAD_LICENSE and
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BAD_LICENSE := LGPL-2.0+, LGPL-2.1+
+GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
