From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:56 +0200
Subject: [Buildroot] [PATCH 009/121] package/gstreamer: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <26ab2309f8d9c962e70b2f080f362aa03f64f8b1.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer/gstreamer/gstreamer.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
index e652eae..2feb6be 100644
--- a/package/gstreamer/gstreamer/gstreamer.hash
+++ b/package/gstreamer/gstreamer/gstreamer.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz.md5
-md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
+# localy computed
+sha256  9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da  gstreamer-0.10.36.tar.xz
-- 
2.7.4
