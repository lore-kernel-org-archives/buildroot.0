From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:13:09 -0700
Subject: [Buildroot] [PATCH 26/27] package/x11r7/xlib_libXt: Add license hash
Message-ID: <20190908161309.27456-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/x11r7/xlib_libXt/xlib_libXt.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 751c370986..60821a8b6a 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002594.html
 sha256	46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a	libXt-1.1.5.tar.bz2
+# Locally calculated
+sha256 4c8ef0aadc0c1697818b3d07bc5e3d5c909f7e15944e36dea9c6b30853ada9f4 COPYING
-- 
2.20.1
