From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:06:00 +0100
Subject: [Buildroot] [git commit] package/gst1-libav: fix syntax error
Message-ID: <20190329160252.30E3983616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b6dcccdb6a53cae04abc280e62945f5fd079129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 8450c34a07..97e069a35f 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -83,7 +83,7 @@ else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
 else
 GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
