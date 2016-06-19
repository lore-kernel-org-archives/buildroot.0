From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:24:09 +0200
Subject: [Buildroot] [git commit] package/gstreamer: add hash file
Message-ID: <20160619194718.4AA6081DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7461a0162bf9b66f51d3a371789ed75b84ddc8bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
index e652eae..4fcf34a 100644
--- a/package/gstreamer/gstreamer/gstreamer.hash
+++ b/package/gstreamer/gstreamer/gstreamer.hash
@@ -1,2 +1,4 @@
 # From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz.md5
 md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
+# locally computed
+sha256  9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da  gstreamer-0.10.36.tar.xz
